defmodule ExStreamClient.TypeInterner do
  @moduledoc """
  Provides a macro for automatically interning typespec atoms at runtime.
  """

  defmacro __using__(_opts) do
    quote do
      @on_load :__intern_typespec_atoms__
      def __intern_typespec_atoms__ do
        case Code.Typespec.fetch_types(__MODULE__) do
          {:ok, types} ->
            types
            |> Enum.filter(&match?({:type, _, :t, _}, &1))
            |> Enum.flat_map(fn {:type, _, _, ast} -> extract_atoms(ast) end)
            |> Enum.uniq()
            |> Enum.each(fn atom ->
              :erlang.binary_to_atom(Atom.to_string(atom), :utf8)
            end)

          :error ->
            :ok
        end

        :ok
      end

      defp extract_atoms({:|, _, [left, right]}),
        do: extract_atoms(left) ++ extract_atoms(right)

      defp extract_atoms({:%{}, _, key_values}),
        do: Enum.flat_map(key_values, fn {k, v} -> extract_atoms(k) ++ extract_atoms(v) end)

      defp extract_atoms({atom, _, nil}) when is_atom(atom),
        do: [atom]

      defp extract_atoms(atom) when is_atom(atom),
        do: [atom]

      defp extract_atoms(_), do: []
    end
  end
end
