defmodule ExStreamClient.Tools.Codegen.GenerateModel do
  @moduledoc """
  Generates the model module based on the parsed OpenAPI spec
  """

  require Logger
  alias Sourceror
  alias ExStreamClient.Tools.Codegen

  @doc "Generates model for the given specification"
  def run(%{components: components, functions: _functions}) do
    Logger.info("Generating model for specification")

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
        |> Enum.sort_by(&to_string/1)

      struct_fields =
        [{:required, component.required_props}, {:optional, component.optional_props}]
        |> Enum.sort_by(fn {kind, props} ->
          {kind, Enum.map(props, & &1.name) |> Enum.sort()}
        end)
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

      nested_components =
        (component.required_props ++ component.optional_props)
        |> Enum.reduce(%{}, fn %{name: name} = prop, acc ->
          {_, type} =
            case Map.get(prop, :type, nil) do
              {:array, {:component, comp}} -> {name, Codegen.string_to_component(comp)}
              {:component, comp} -> {name, Codegen.string_to_component(comp)}
              {:enum, _} -> {name, :atom}
              _ -> {nil, nil}
            end

          if type != nil, do: Map.put(acc, String.to_atom(name), type), else: acc
        end)
        |> Enum.sort_by(fn {name, _type} -> to_string(name) end)
        |> Keyword.new()

      struct_ast =
        if required_field_keys == [] do
          [
            # only defstruct
            quote do
              defstruct unquote(Map.keys(struct_fields) |> Enum.sort())
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
              defstruct unquote(Map.keys(struct_fields) |> Enum.sort())
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

            @nested_components unquote(nested_components)

            def nested_components, do: @nested_components

            unquote_splicing(
              case component.kind do
                :component ->
                  spec_ast =
                    Map.to_list(struct_fields)
                    |> Enum.sort_by(fn {name, _type} -> to_string(name) end)

                  [
                    quote do
                      @type t :: %__MODULE__{unquote_splicing(spec_ast)}
                    end
                  ]

                :oneOf ->
                  quoted_type = Codegen.type_to_spec({:oneOf, component.components})

                  if is_enum(component.components) do
                    {:enum, values} = component.components

                    [
                      quote do
                        @type t :: unquote(quoted_type)
                      end,
                      quote do
                        @values unquote(values)
                      end,
                      quote do
                        # intern values to avoid String.to_existing_atom/1 errors.
                        for value <- @values, do: _ = value
                      end
                    ]
                  else
                    [
                      quote do
                        @type t :: unquote(quoted_type)
                      end
                    ]
                  end

                :enum ->
                  quoted_type = Codegen.type_to_spec({:enum, component.enum})
                  IO.inspect(quoted_type)

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

  defp is_enum({:enum, _}), do: true
  defp is_enum(_), do: false
end
