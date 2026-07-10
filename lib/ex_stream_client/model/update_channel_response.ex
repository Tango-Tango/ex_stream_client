defmodule ExStreamClient.Model.UpdateChannelResponse do
  @moduledoc "Schema representing a UpdateChannelResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :members]
  defstruct [:channel, :duration, :members, :message]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     members: ExStreamClient.Model.ChannelMemberResponse,
                     message: ExStreamClient.Model.MessageResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t(),
          members: [ExStreamClient.Model.ChannelMemberResponse.t()],
          message: ExStreamClient.Model.MessageResponse.t() | nil
        }
end
