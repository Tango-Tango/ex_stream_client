defmodule ExStreamClient.Model.UpdateMemberPartialRequest do
  @moduledoc "Schema representing a UpdateMemberPartialRequest"
  use ExStreamClient.Jason
  defstruct [:set, :unset]
  @type t :: %__MODULE__{set: map() | nil, unset: [String.t()] | nil}
end