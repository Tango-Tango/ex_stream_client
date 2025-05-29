defmodule ExStreamClient.Model.SendEventRequest do
  @moduledoc "Schema representing a SendEventRequest"
  use ExStreamClient.Jason
  @enforce_keys [:event]
  defstruct [:event]
  @type t :: %__MODULE__{event: ExStreamClient.Model.EventRequest.t()}
end