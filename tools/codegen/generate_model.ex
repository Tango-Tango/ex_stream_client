defmodule ExStreamClient.Tools.Codegen.GenerateModel do
  @moduledoc """
  Generates the model module based on the parsed OpenAPI spec
  """

  alias Sourceror
  alias ExStreamClient.Tools.Codegen

  @model_dir "lib/ex_stream_client/model"

  @doc "Generates model for the given specification"
  def run(%{components: components, functions: _functions}) do
    IO.puts("Generating model for specification")

    components =
      components
      |> Enum.map(fn {name, c} ->
        {name |> Codegen.string_to_component(), c}
      end)
      |> Enum.filter(fn {name, _c} ->
        name not in Codegen.module_overwrites()
      end)

    Enum.each(components, fn {name, component} ->
      required_field_keys =
        component.required_props
        |> Enum.map(&(&1.name |> Macro.underscore() |> String.to_atom()))
        |> Enum.uniq()

      struct_fields =
        [{:required, component.required_props}, {:optional, component.optional_props}]
        |> Enum.map(fn {kind, i} ->
          Enum.reduce(i, %{}, fn item, acc ->
            field_name = item.name |> Macro.underscore() |> String.to_atom()
            field_type = item.type

            quoted_type =
              case kind do
                :required ->
                  quote(do: unquote(Codegen.type_to_spec(field_type)))

                :optional ->
                  quote(do: unquote(Codegen.type_to_spec(field_type)) | nil)
              end

            Map.put(acc, field_name, quoted_type)
          end)
        end)
        |> Enum.reduce(&Map.merge/2)

      struct_ast =
        if required_field_keys == [] do
          [
            # only defstruct
            quote do
              defstruct unquote(Map.keys(struct_fields))
            end
          ]
        else
          [
            # enforce only the required props
            quote do
              @enforce_keys unquote(required_field_keys)
            end,

            # then the struct with all fields
            quote do
              defstruct unquote(Map.keys(struct_fields))
            end
          ]
        end

      docstring_head =
        "Schema representing a #{Module.split(name) |> List.last()}"

      mod_ast =
        quote do
          defmodule unquote(name) do
            @moduledoc unquote(docstring_head)

            use ExStreamClient.Jason

            unquote_splicing(struct_ast)

            unquote_splicing(
              case component.kind do
                :component ->
                  spec_ast = Map.to_list(struct_fields)

                  [
                    quote do
                      @type t :: %__MODULE__{unquote_splicing(spec_ast)}
                    end
                  ]

                :oneOf ->
                  quoted_type = Codegen.type_to_spec({:oneOf, component.components})

                  [
                    quote do
                      @type t :: unquote(quoted_type)
                    end
                  ]

                :enum ->
                  quoted_type = Codegen.type_to_spec({:enum, component.enum})

                  [
                    quote do
                      @type t :: unquote(quoted_type)
                    end
                  ]

                :allOf ->
                  quoted_type = Codegen.type_to_spec({:oneOf, component.components})

                  [
                    quote do
                      @type t :: unquote(quoted_type)
                    end
                  ]
              end
            )
          end
        end

      file_path =
        name
        |> Module.split()
        |> Enum.map(&Macro.underscore/1)
        |> then(&(Path.join(["lib" | &1]) <> ".ex"))

      File.mkdir_p!(Path.dirname(file_path))
      File.write!(file_path, Macro.to_string(mod_ast))
    end)
  end
end
