defmodule ExStreamClient.Model.CreateImportURLRequest do
  @moduledoc "Schema representing a CreateImportURLRequest"
  use ExStreamClient.Jason
  defstruct [:filename]
  @type t :: %__MODULE__{filename: String.t() | nil}
end