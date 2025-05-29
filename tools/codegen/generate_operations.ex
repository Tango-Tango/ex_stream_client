defmodule ExStreamClient.Tools.Codegen.GenerateOperations do
  @moduledoc """
  Generates the operations module based on the parsed OpenAPI spec
  """
  alias Sourceror
  alias ExStreamClient.Tools.Codegen

  @ops_dir "lib/ex_stream_client/operations"

  @doc "Generates operations for the given specification"
  def run(%{components: _components, functions: functions}) do
    IO.puts("Generating operations for specification")

    functions
    |> Enum.reduce(%{}, fn fx, acc ->
      Map.put(acc, fx.group, [fx | Map.get(acc, fx.group, [])])
    end)
    |> Enum.each(fn {name, functions} ->
      modname =
        name
        |> String.replace("-", "_")
        |> Macro.camelize()
        |> String.to_atom()
        |> (&Module.concat(ExStreamClient, &1)).()

      file_path =
        [@ops_dir, Macro.underscore(name) <> ".ex"]
        |> Path.join()

      moduledoc_string =
        [
          "",
          "Modules for interacting with the `#{name}` group of OpenAI APIs\n",
          "API Reference: https://platform.openai.com/docs/api-reference/#{name}",
          ""
        ]
        |> Enum.join("\n\t")

      function_asts =
        functions
        |> Enum.map(fn fx ->
          %{
            name: function_name,
            summary: summary,
            arguments: args,
            endpoint: endpoint,
            deprecated?: _deprecated,
            method: method,
            response_type: response_type,
            group: _group
          } = fx

          name = String.to_atom(function_name)

          merged_required_args =
            Enum.filter(args, &Map.get(&1, :required?)) ++
              if(is_nil(get_in(fx, [:request_body, :request_schema, :required_props])),
                do: [],
                else: [
                  %{
                    name: "payload",
                    type: {:component, fx.request_body.ref}
                  }
                ]
              )

          merged_optional_args = Enum.filter(args, &(!Map.get(&1, :required?)))
          has_optional_args? = !Enum.empty?(merged_optional_args)
          required_args_docstring = build_arg_docstring(merged_required_args)
          optional_args_docstring = build_arg_docstring(merged_optional_args)

          # convert non-optional args into [arg1, arg2, arg3] representation
          arg_names =
            merged_required_args
            |> Enum.map(&(Map.get(&1, :name) |> String.to_atom() |> Macro.var(nil)))

          # convert non-optional args into spec definition [String.t(), String.t(), etc.] representation
          spec =
            merged_required_args
            |> Enum.map(fn item ->
              quote do: unquote(Codegen.type_to_spec(item.type))
            end)

          # construct response spec
          # for list types, instead of {:ok, list1 | list2}, we want {:ok, list1} | {:ok, list2}
          response_spec =
            case response_type do
              {:oneOf, c} ->
                Enum.map(c, fn comp -> {:ok, Codegen.type_to_spec(comp)} end)
                |> Enum.reduce(&{:|, [], [&1, &2]})

              {:component, _} = comp ->
                {:ok, Codegen.type_to_spec(comp)}

              etc ->
                {:ok, Codegen.type_to_spec(etc)}
            end

          optional_args =
            merged_optional_args
            |> Enum.reduce([], fn item, acc ->
              name = item.name
              type = item.type

              case acc do
                [] ->
                  quote do: {unquote(String.to_atom(name)), unquote(Codegen.type_to_spec(type))}

                val ->
                  quote do:
                          {unquote(String.to_atom(name)), unquote(Codegen.type_to_spec(type))}
                          | unquote(val)
              end
            end)
            |> case do
              [] -> []
              e -> [e]
            end

          required_spec_ast =
            quote do
              # fx without opts
              @spec unquote(name)(unquote_splicing(spec)) ::
                      unquote(response_spec) | {:error, any()}
            end

          optional_spec_ast =
            if has_optional_args? do
              quote do
                # fx with opts
                @spec unquote(name)(unquote_splicing(spec), unquote(optional_args)) ::
                        unquote(response_spec) | {:error, any()}
              end
            else
              quote do
              end
            end

          doc_ast =
            quote do
              @doc unquote(
                     [
                       "",
                       summary,
                       "",
                       "### Required Arguments:",
                       "\t#{required_args_docstring}"
                     ]
                     |> maybe_append(merged_optional_args != [], "### Optional Arguments:")
                     |> maybe_append(
                       merged_optional_args != [],
                       "\t#{optional_args_docstring}"
                     )
                     |> maybe_append(true, "")
                     |> Enum.join("\n\t")
                     |> as_heredoc()
                   )
            end

          opts_param_ast =
            if has_optional_args? do
              [quote(do: opts \\ [])]
            else
              []
            end

          url_ast =
            endpoint
            |> String.replace(~r/\{(\w+)\}/, "#\\{\\1\\}")
            |> then(&"\"#{&1}\"")
            |> Code.string_to_quoted!()

          body_params =
            if Enum.any?(merged_required_args, &(&1.name == "payload")) do
              [quote(do: {:json, unquote(Macro.var(:payload, nil))})]
            else
              []
            end

          has_query? =
            Enum.any?(
              merged_required_args ++ merged_optional_args,
              &Kernel.==(Map.get(&1, :in, ""), "query")
            )

          required_query_params_ast =
            merged_required_args
            |> Enum.filter(&(Kernel.==(Map.get(&1, :in, ""), "query") && Map.get(&1, :required?)))
            |> Enum.map(fn var ->
              quote do:
                      {unquote(String.to_existing_atom(var.name)),
                       unquote(Macro.var(String.to_existing_atom(var.name), nil))}
            end)

          optional_query_params_ast =
            merged_optional_args
            |> Enum.filter(
              &(Kernel.==(Map.get(&1, :in, ""), "query") && !Map.get(&1, :required?))
            )
            |> Enum.map(&String.to_atom(&1.name))

          query_params_ast =
            cond do
              has_query? and has_optional_args? ->
                quote do
                  Keyword.merge(
                    [unquote_splicing(required_query_params_ast)],
                    Keyword.take(opts, unquote(optional_query_params_ast))
                  )
                  |> Enum.reject(fn {_k, v} -> is_nil(v) end)
                  |> Map.new()
                end

              has_query? ->
                quote do
                  [unquote_splicing(required_query_params_ast)]
                  |> Map.new()
                end

              true ->
                quote do
                  %{}
                end
            end

          method_impl_ast =
            quote do
              def unquote(name)(unquote_splicing(arg_names), unquote_splicing(opts_param_ast)) do
                request_opts =
                  [
                    url: unquote(url_ast),
                    method: unquote(method),
                    params: unquote(query_params_ast)
                  ] ++ unquote(body_params)

                r =
                  Req.new(request_opts)
                  |> Req.Request.append_response_steps(
                    decode: fn {request, response} ->
                      case response.status do
                        code when code in 200..299 ->
                          parsed =
                            Codegen.convert_response(
                              {:ok, response.body},
                              unquote(response_type)
                            )

                          {request, %{response | body: {:ok, parsed}}}

                        _ ->
                          {request, response}
                      end
                    end
                  )

                ExStreamClient.Client.request(r)
              end
            end

          []
          |> maybe_append(true, doc_ast)
          |> maybe_append(true, required_spec_ast)
          |> maybe_append(has_optional_args?, optional_spec_ast)
          |> maybe_append(true, method_impl_ast)
        end)

      mod_ast =
        quote do
          defmodule unquote(modname) do
            @moduledoc unquote(moduledoc_string)
            require Logger
            unquote_splicing(function_asts |> List.flatten())
          end
        end

      File.mkdir_p!(Path.dirname(file_path))
      File.write!(file_path, Sourceror.to_string(mod_ast, locals_wihtout_parens: []))
    end)
  end

  defp build_arg_docstring(args) do
    Enum.map_join(args, "\n\t\t", fn i ->
      s = "- `#{i.name}`"

      s =
        if Map.has_key?(i, :description), do: "#{s}: #{Map.get(i, :description)}", else: s

      s =
        if Map.get(i, :example, "") != "",
          do: "#{s}\n\n*Example*: `#{Map.get(i, :example)}`",
          else: s

      s =
        case i.type do
          {:component, ref} -> "#{s}: #{ref}"
          _ -> s
        end

      s
    end)
  end

  defp as_heredoc(string) do
    {:sigil_S, [],
     [
       {:<<>>, [], [string]},
       []
     ]}
  end

  defp maybe_append(list, false, _), do: list
  defp maybe_append(list, true, item), do: list ++ [item]
end
