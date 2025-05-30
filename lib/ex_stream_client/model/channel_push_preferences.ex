defmodule ExStreamClient.Model.ChannelPushPreferences do
  @moduledoc "Schema representing a ChannelPushPreferences"
  use ExStreamClient.Jason
  defstruct [:chat_level, :disabled_until]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{chat_level: String.t() | nil, disabled_until: float() | nil}
end
