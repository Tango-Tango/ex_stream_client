defmodule ExStreamClient.Jason do
  @moduledoc """
  Provides JSON encoding for OpenAPI-generated structs,
  converting snake_case fields to camelCase JSON keys.
  """

  defmacro __using__(_opts) do
    quote do
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
        processed =
          Enum.reduce(nested_components(), map, fn {key, type_or_mod}, acc ->
            case Map.fetch(acc, key) do
              {:ok, val} -> Map.put(acc, key, transform(val, type_or_mod))
              :error -> acc
            end
          end)

        struct(__MODULE__, processed)
      end

      @doc """
      Components could just be enums that are typed - so we need to decode those as enums as they will just be stings
      """
      def decode(map) when is_binary(map) do
        transform(map, :atom)
      end

      defp transform(val, :atom) when is_binary(val), do: String.to_existing_atom(val)
      defp transform(val, :atom) when is_list(val), do: Enum.map(val, &String.to_existing_atom/1)

      defp transform(val, mod) when is_list(val) and is_atom(mod) do
        if Code.ensure_loaded?(mod) and function_exported?(mod, :decode, 1) do
          Enum.map(val, &mod.decode/1)
        else
          val
        end
      end

      defp transform(val, mod) when is_map(val) and is_atom(mod) do
        if Code.ensure_loaded?(mod) and function_exported?(mod, :decode, 1) do
          mod.decode(val)
        else
          val
        end
      end

      # Fallback
      defp transform(val, _), do: val
    end
  end
end
