defmodule ExStreamClient.JSON do
  @moduledoc """
  Provides JSON encoding for OpenAPI-generated structs,
  converting snake_case fields to camelCase JSON keys.
  """

  defmacro __using__(_opts) do
    quote do
      require Logger

      defimpl Jason.Encoder, for: __MODULE__ do
        def encode(struct, opts) do
          struct
          |> Map.from_struct()
          |> Map.reject(fn {_k, v} -> is_nil(v) end)
          |> Jason.Encode.map(opts)
        end
      end

      @doc """
      Build a struct from a map, transforming nested components and atom fields.
      """
      def decode(map) when is_map(map) do
        valid_keys =
          struct(__MODULE__, %{})
          |> Map.from_struct()
          |> Map.keys()
          |> Enum.map(&to_string/1)

        # Now that the module is loaded, convert to atom keys
        map =
          for {k, v} <- map, into: %{}, do: {transform(Macro.underscore(k), :atom, valid_keys), v}

        processed =
          Enum.reduce(nested_components(), map, fn {key, type_or_mod}, acc ->
            case Map.fetch(acc, key) do
              {:ok, val} -> Map.put(acc, key, transform(val, type_or_mod, :all))
              :error -> acc
            end
          end)

        struct(__MODULE__, processed)
      end

      @doc """
      Components could just be enums that are typed - so we need to decode those as enums as they will just be stings
      """
      def decode(map) when is_binary(map) do
        transform(map, :atom, :all)
      end

      defp transform(val, :atom, :all) when is_binary(val) do
        String.to_existing_atom(val)
      rescue
        ArgumentError ->
          Logger.warning(
            "Failed to convert #{val} to existing atom, as it wasn't found in the atoms table."
          )

          val
      end

      defp transform(val, :atom, valid_keys) when is_binary(val) do
        if val in valid_keys do
          String.to_existing_atom(val)
        else
          val
        end
      end

      defp transform(val, :atom, valid_keys) when is_list(val),
        do: Enum.map(val, &transform(&1, :atom, :all))

      defp transform(val, {:map, {:array, {:component, mod}}}, valid_keys) when is_map(val),
        do:
          Enum.map(val, fn {k, v} ->
            {transform(k, :atom, :all), Enum.map(v, &transform(&1, mod, :all))}
          end)
          |> Enum.into(%{})

      defp transform(val, {:map, mod}, valid_keys) when is_map(val),
        do:
          Enum.map(val, fn {k, v} ->
            {transform(k, :atom, :app), transform(v, mod, :all)}
          end)
          |> Enum.into(%{})

      defp transform(val, mod, _) when is_list(val) and is_atom(mod) do
        if Code.ensure_loaded?(mod) and function_exported?(mod, :decode, 1) do
          Enum.map(val, &mod.decode/1)
        else
          val
        end
      end

      defp transform(val, mod, _) when is_map(val) and is_atom(mod) do
        if Code.ensure_loaded?(mod) and function_exported?(mod, :decode, 1) do
          mod.decode(val)
        else
          val
        end
      end

      # Fallback
      defp transform(val, _, _), do: val
    end
  end
end
