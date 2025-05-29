defmodule ExStreamClient.Model.UpdateUserPartialRequest do
  @moduledoc "Schema representing a UpdateUserPartialRequest"
  use ExStreamClient.Jason
  @enforce_keys [:id]
  defstruct [:id, :set, :unset]
  @type t :: %__MODULE__{id: String.t(), set: map() | nil, unset: [String.t()] | nil}
end