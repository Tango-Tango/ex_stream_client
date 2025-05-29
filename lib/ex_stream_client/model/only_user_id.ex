defmodule ExStreamClient.Model.OnlyUserID do
  @moduledoc "Schema representing a OnlyUserID"
  use ExStreamClient.Jason
  @enforce_keys [:id]
  defstruct [:id]
  @type t :: %__MODULE__{id: String.t()}
end