defmodule ExStreamClient.Model.Data do
  @moduledoc "Schema representing a Data"
  use ExStreamClient.Jason
  @enforce_keys [:id]
  defstruct [:id]
  @type t :: %__MODULE__{id: String.t()}
end