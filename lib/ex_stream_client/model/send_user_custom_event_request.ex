defmodule ExStreamClient.Model.SendUserCustomEventRequest do
  @moduledoc "Schema representing a SendUserCustomEventRequest"
  use ExStreamClient.Jason
  @enforce_keys [:event]
  defstruct [:event]
  @type t :: %__MODULE__{event: ExStreamClient.Model.UserCustomEventRequest.t()}
end