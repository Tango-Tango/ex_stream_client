defmodule ExStreamClient.Model.GroupedChannelsBucket do
  @moduledoc "Schema representing a GroupedChannelsBucket"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channels]
  defstruct [:channels, :unread_channels]
  @nested_components channels: ExStreamClient.Model.ChannelStateResponseFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channels: [ExStreamClient.Model.ChannelStateResponseFields.t()],
          unread_channels: integer() | nil
        }
end
