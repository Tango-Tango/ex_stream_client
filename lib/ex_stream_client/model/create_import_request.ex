defmodule ExStreamClient.Model.CreateImportRequest do
  @moduledoc "Schema representing a CreateImportRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:mode, :path]
  defstruct [:mode, :path]
  @nested_components mode: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{mode: :upsert | :insert, path: String.t()}
end
