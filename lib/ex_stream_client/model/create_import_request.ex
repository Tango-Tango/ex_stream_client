defmodule ExStreamClient.Model.CreateImportRequest do
  @moduledoc "Schema representing a CreateImportRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:mode, :path]
  defstruct [:merge_custom, :mode, :path]
  @nested_components mode: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{merge_custom: boolean() | nil, mode: :upsert | :insert, path: String.t()}
end
