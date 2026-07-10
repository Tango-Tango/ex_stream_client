defmodule ExStreamClient.Model.ChannelMessagesResponse do
  @moduledoc "Schema representing a ChannelMessagesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel, :messages]
  defstruct [:channel, :messages]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     messages: ExStreamClient.Model.MessageResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t(),
          messages: [ExStreamClient.Model.MessageResponse.t()]
        }
end
