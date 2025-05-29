defmodule ExStreamClient.Model.UserCustomEventRequest do
  @moduledoc "Schema representing a UserCustomEventRequest"
  use ExStreamClient.Jason
  @enforce_keys [:type]
  defstruct [:type, :custom]
  @type t :: %__MODULE__{type: String.t(), custom: map() | nil}
end