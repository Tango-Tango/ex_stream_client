defmodule ExStreamClient.Model.ChannelPushPreferences do
  @moduledoc "Schema representing a ChannelPushPreferences"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:chat_level, :disabled_until]
  @nested_components disabled_until: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          chat_level: String.t() | nil,
          disabled_until: (DateTime.t() | integer() | String.t()) | nil
        }
end
