defmodule ExStreamClient.Model.CreateImportRequest do
  @moduledoc "Schema representing a CreateImportRequest"
  use ExStreamClient.Jason
  @enforce_keys [:mode, :path]
  defstruct [:mode, :path]
  @type t :: %__MODULE__{mode: :upsert | :insert, path: String.t()}
end