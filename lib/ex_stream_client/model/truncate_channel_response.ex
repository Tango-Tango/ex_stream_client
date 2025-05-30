defmodule ExStreamClient.Model.TruncateChannelResponse do
  @moduledoc "Schema representing a TruncateChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:channel, :duration, :message]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     message: ExStreamClient.Model.MessageResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t(),
          message: ExStreamClient.Model.MessageResponse.t() | nil
        }
end
