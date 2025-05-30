defmodule ExStreamClient.Model.UpdateChannelPartialResponse do
  @moduledoc "Schema representing a UpdateChannelPartialResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :members]
  defstruct [:channel, :duration, :members]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     members: ExStreamClient.Model.ChannelMemberResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t(),
          members: [ExStreamClient.Model.ChannelMemberResponse.t()]
        }
end
