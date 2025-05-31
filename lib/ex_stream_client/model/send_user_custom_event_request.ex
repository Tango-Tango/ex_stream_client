defmodule ExStreamClient.Model.SendUserCustomEventRequest do
  @moduledoc "Schema representing a SendUserCustomEventRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:event]
  defstruct [:event]
  @nested_components event: ExStreamClient.Model.UserCustomEventRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{event: ExStreamClient.Model.UserCustomEventRequest.t()}
end
