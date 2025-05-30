defmodule ExStreamClient.Model.QueryChannelsResponse do
  @moduledoc "Schema representing a QueryChannelsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:channels, :duration]
  defstruct [:channels, :duration]
  @nested_components %{channels: ExStreamClient.Model.ChannelStateResponseFields}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channels: [ExStreamClient.Model.ChannelStateResponseFields.t()],
          duration: String.t()
        }
end
