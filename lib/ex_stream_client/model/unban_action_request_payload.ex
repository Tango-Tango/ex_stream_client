defmodule ExStreamClient.Model.UnbanActionRequestPayload do
  @moduledoc "Schema representing a UnbanActionRequestPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:channel_cid, :decision_reason, :remove_future_channels_ban]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_cid: String.t() | nil,
          decision_reason: String.t() | nil,
          remove_future_channels_ban: boolean() | nil
        }
end
