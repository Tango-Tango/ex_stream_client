defmodule ExStreamClient.Model.ChannelMessages do
  @moduledoc "Schema representing a ChannelMessages"
  use ExStreamClient.Jason
  @enforce_keys [:messages]
  defstruct [:channel, :messages]

  @nested_components %{
    messages: ExStreamClient.Model.Message,
    channel: ExStreamClient.Model.ChannelResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          messages: [ExStreamClient.Model.Message.t()]
        }
end
