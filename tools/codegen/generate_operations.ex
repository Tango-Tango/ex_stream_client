defmodule ExStreamClient.Tools.Codegen.GenerateOperations do
  @moduledoc """
  Generates the operations module based on the parsed OpenAPI spec
  """
  require Logger
  alias Sourceror
  alias ExStreamClient.Tools.Codegen

  @ops_dir "lib/ex_stream_client/operations"

  @doc "Generates operations for the given specification"
  def run(%{components: _components, functions: functions}) do
    Logger.info("Generating operations for specification")

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
        |> (&Module.concat(ExStreamClient.Operations, &1)).()

      file_path =
        [@ops_dir, Macro.underscore(name) <> ".ex"]
        |> Path.join()

      function_asts =
        functions
        |> Enum.map(fn fx ->
          %{
            name: function_name,
            summary: summary,
            description: description,
            arguments: args,
            endpoint: endpoint,
            deprecated?: _deprecated,
            method: method,
            response_type: response_type,
            group: _group,
            responses: responses
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

          optional_args_docstring =
            build_arg_docstring(merged_optional_args |> Enum.sort_by(& &1.name))

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

          optional_args =
            if Enum.empty?(optional_args) do
              quote do
                shared_opts
              end
            else
              quote do
                [unquote_splicing(optional_args) | shared_opts]
              end
            end

          spec_ast =
            quote do
              # fx without opts
              @spec unquote(name)(unquote_splicing(spec), unquote(optional_args)) ::
                      unquote(response_spec) | {:error, any()}
            end

          description_str = if(description == "", do: summary, else: description)

          doc_ast =
            quote do
              @doc unquote(
                     [format_events_as_code(description_str), ""]
                     |> maybe_append(merged_required_args != [], "### Required Arguments:")
                     |> maybe_append(merged_required_args != [], "#{required_args_docstring}")
                     |> maybe_append(true, "### Optional Arguments:")
                     |> maybe_append(has_optional_args?, "#{optional_args_docstring}")
                     |> maybe_append(
                       true,
                       "- All options from [Shared Options](#module-shared-options) are supported."
                     )
                     |> maybe_append(true, "")
                     |> Enum.join("\n")
                     |> as_heredoc()
                   )
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
                end

              has_query? ->
                quote do
                  [unquote_splicing(required_query_params_ast)]
                end

              true ->
                quote do
                  []
                end
            end

          # Create a map of response code to struct creation code
          response_handlers =
            Enum.map(responses, fn {code, response_type} ->
              # Generate the appropriate struct creation code based on the response type
              struct_creation_code =
                case response_type do
                  {:component, comp} ->
                    # Get the full module name for the component
                    struct_module = Codegen.string_to_component(comp)

                    # Generate code to create the struct
                    quote do
                      unquote(struct_module)
                    end

                  _ ->
                    # For any other type, just return the body
                    quote do
                      response.body
                    end
                end

              # Create a map entry with the status code and the struct creation code
              {code, struct_creation_code}
            end)

          # Add the decode step to the request
          method_impl_ast =
            quote do
              def unquote(name)(unquote_splicing(arg_names), opts \\ []) do
                client = get_client(opts)

                request_opts =
                  [
                    url: unquote(url_ast),
                    method: unquote(method),
                    params: unquote(query_params_ast)
                  ] ++ unquote(body_params)

                request_opts = Keyword.merge(request_opts, Keyword.get(opts, :req_opts, []))

                r =
                  Req.new(request_opts)
                  |> Req.Request.append_response_steps(
                    decode: fn {request, response} ->
                      response_handlers = %{
                        unquote_splicing(response_handlers)
                      }

                      {request, %{response | body: decode_response(response, response_handlers)}}
                    end
                  )

                case client.request(r, get_request_opts(opts)) do
                  {:ok, response} -> response.body
                  {:error, error} -> {:error, error}
                end
              end
            end

          []
          |> maybe_append(true, doc_ast)
          |> maybe_append(true, spec_ast)
          |> maybe_append(true, method_impl_ast)
        end)

      moduledoc_string =
        [
          "Modules for interacting with the `#{name}` group of Stream APIs\n",
          "API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2",
          "\n",
          "### Shared options",
          "All functions in this module accept the following optional parameters:",
          "",
          " * `api_key` - API key to use. If not provided, the default key from config will be used",
          " * `api_key_secret` - API key secret to use. If not provided, the default secret from config will be used",
          " * `endpoint` - endpoint to use. If not provided, the default endpoint from config will be used",
          " * `client` - HTTP client to use. Must implement `ExStreamClient.Http.Behavior`. Defaults to `ExStreamClient.Http`",
          " * `req_opts` - all of these options will be forwarded to req. See `Req.new/1` for available options",
          ""
        ]
        |> Enum.join("\n")

      shared_optional_args = [
        %{
          in: "opts",
          name: "api_key",
          type: "string",
          description:
            "API key to use. If not provided, the default key from config will be used.",
          required?: false,
          example: "ExStreamClient.Config.api_key()"
        },
        %{
          in: "opts",
          name: "api_key_secret",
          type: "string",
          description:
            "API key secret to use. If not provided, the default secret from config will be used.",
          required?: false,
          example: "ExStreamClient.Config.api_key_secret()"
        },
        %{
          in: "opts",
          name: "client",
          type: "module",
          description: "HTTP client to use. Must implement `ExStreamClient.Http.Behavior`",
          required?: false,
          example: "ExStreamClient.Http"
        },
        %{
          in: "opts",
          name: "endpoint",
          type: "string",
          description:
            "Endpoint to use. If not provided, the default endpoint from config will be used.",
          required?: false,
          example: "ExStreamClient.Config.endpoint()"
        },
        %{
          in: "opts",
          name: "req_opts",
          type: "keyword",
          description:
            "all of these options will be forwarded to req. See `Req.new/1` for available options",
          required?: false,
          example: "[plug: MyTest.Plug]"
        }
      ]

      shared_optional_args_ast =
        shared_optional_args
        |> Enum.map(fn arg ->
          quote do
            {unquote(String.to_atom(arg.name)), unquote(Codegen.type_to_spec(arg.type))}
          end
        end)

      mod_ast =
        quote do
          defmodule unquote(modname) do
            @moduledoc unquote(as_heredoc(moduledoc_string))
            require Logger

            @type shared_opts :: unquote(shared_optional_args_ast)

            unquote_splicing(function_asts |> List.flatten())

            defp get_client(opts) do
              client = Keyword.get(opts, :client, ExStreamClient.Http)

              unless Code.ensure_loaded?(client) and function_exported?(client, :request, 2) do
                raise ArgumentError,
                      "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
              end

              client
            end

            defp decode_response(response, response_handlers) do
              case Map.get(response_handlers, response.status) do
                nil -> {:error, response.body}
                mod -> {get_response_type(response), mod.decode(response.body)}
              end
            end

            defp get_response_type(response),
              do: if(response.status in 200..299, do: :ok, else: :error)

            defp get_request_opts(opts) do
              Keyword.take(
                opts,
                [:api_key, :api_key_secret, :endpoint]
              )
            end
          end
        end

      File.mkdir_p!(Path.dirname(file_path))
      File.write!(file_path, Sourceror.to_string(mod_ast, locals_wihtout_parens: []))
    end)
  end

  defp format_events_as_code(description) do
    description
    |> String.split("\n")
    |> Enum.reduce({[], false}, fn
      "- " <> event, {acc, true} -> {["- `#{event}`" | acc], true}
      line, {acc, true} -> {[line | acc], line == ""}
      "Sends events" <> _ = line, {acc, false} -> {["### #{line}" | acc], true}
      line, {acc, in_events} -> {[line | acc], in_events}
    end)
    |> elem(0)
    |> Enum.reverse()
    |> Enum.join("\n")
  end

  defp build_arg_docstring(args) do
    Enum.map_join(args, "\n", fn i ->
      s = "- `#{i.name}`"

      s =
        if Map.has_key?(i, :description), do: "#{s}: #{Map.get(i, :description)}", else: s

      s =
        if Map.get(i, :example, "") != "",
          do: "#{s}(e.g., `#{Map.get(i, :example)}`)",
          else: s

      s =
        case i.type do
          {:component, ref} -> "#{s}: `#{Codegen.string_to_component(ref)}`"
          _ -> s
        end

      s
    end)
  end

  defp as_heredoc(string) do
    {:sigil_S, [delimiter: ~s(""")],
     [
       {:<<>>, [indentation: 0], [string]},
       []
     ]}
  end

  defp maybe_append(list, false, _), do: list
  defp maybe_append(list, true, item), do: list ++ [item]
end
