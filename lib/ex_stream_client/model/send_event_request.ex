defmodule ExStreamClient.Model.SendEventRequest do
  @moduledoc "Schema representing a SendEventRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:event]
  defstruct [:event]
  @nested_components event: ExStreamClient.Model.EventRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{event: ExStreamClient.Model.EventRequest.t()}
end
