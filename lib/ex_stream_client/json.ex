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
        # Now that the module is loaded, convert to atom keys
        map =
          for {k, v} <- map, into: %{}, do: {transform(Macro.underscore(k), :atom), v}

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

      defp transform(val, :atom) when is_binary(val) do
        String.to_existing_atom(val)
      rescue
        ArgumentError ->
          Logger.debug(
            "Failed to convert #{val} to existing atom, as it wasn't found in the atoms table."
          )

          val
      end

      defp transform(val, :atom) when is_list(val),
        do: Enum.map(val, &transform(&1, :atom))

      defp transform(val, {:map, {:array, {:component, mod}}}) when is_map(val),
        do:
          Enum.map(val, fn {k, v} -> {k, Enum.map(v, &transform(&1, mod))} end)
          |> Enum.into(%{})

      defp transform(val, {:map, mod}) when is_map(val),
        do:
          Enum.map(val, fn {k, v} -> {k, transform(v, mod)} end)
          |> Enum.into(%{})

      # Handles enums, where value is a string and potential values are a list of atoms
      # i.e. automod: :enum in ChannelConfig
      defp transform(val, :enum) when is_binary(val) do
        decode(val)
      end

      # Handles enums, where value is intended as a datetime but value is ISO8601 string
      defp transform(val, :datetime) when is_binary(val) do
        case DateTime.from_iso8601(val) do
          {:ok, datetime} -> datetime
          _ -> val
        end
      end

      # Handles enums, where value is intended as a datetime but value is a unix timestamp
      defp transform(val, :datetime) when is_integer(val) do
        case DateTime.from_unix(val, :nanosecond) do
          {:ok, datetime} -> datetime
          _ -> val
        end
      end

      # Handles components, where value is a map and the module is the struct to decode to
      # i.e. blocklists: ExStreamClient.Model.BlockListOptions in ChannelConfig
      defp transform(val, mod) when is_list(val) and is_atom(mod) do
        if Code.ensure_loaded?(mod) and function_exported?(mod, :decode, 1) do
          Enum.map(val, &mod.decode/1)
        else
          val
        end
      end

      # Handles components, where value is a map and the module is the struct to decode to
      # i.e. automod_thresholds: ExStreamClient.Model.Thresholds in ChannelConfig
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
