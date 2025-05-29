defmodule ExStreamClient.Model.UserCustomEventRequest do
  @moduledoc "Schema representing a UserCustomEventRequest"
  use ExStreamClient.Jason
  @enforce_keys [:type]
  defstruct [:custom, :type]
  @type t :: %__MODULE__{custom: map() | nil, type: String.t()}
end