defmodule ExStreamClient.Model.DeleteChannelResponse do
  @moduledoc "Schema representing a DeleteChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:channel, :duration]
  @nested_components channel: ExStreamClient.Model.ChannelResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          duration: String.t()
        }
end
