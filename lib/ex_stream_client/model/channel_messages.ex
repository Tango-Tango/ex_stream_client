defmodule ExStreamClient.Model.ChannelMessages do
  @moduledoc "Schema representing a ChannelMessages"
  use ExStreamClient.Jason
  @enforce_keys [:messages]
  defstruct [:channel, :messages]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     messages: ExStreamClient.Model.Message
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          messages: [ExStreamClient.Model.Message.t()]
        }
end
