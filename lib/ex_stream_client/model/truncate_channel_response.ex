defmodule ExStreamClient.Model.TruncateChannelResponse do
  @moduledoc "Schema representing a TruncateChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:channel, :duration, :message]

  @nested_components %{
    message: ExStreamClient.Model.MessageResponse,
    channel: ExStreamClient.Model.ChannelResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t(),
          message: ExStreamClient.Model.MessageResponse.t() | nil
        }
end
