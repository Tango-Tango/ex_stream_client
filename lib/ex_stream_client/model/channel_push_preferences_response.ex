defmodule ExStreamClient.Model.ChannelPushPreferencesResponse do
  @moduledoc "Schema representing a ChannelPushPreferencesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:chat_level, :chat_preferences, :disabled_until]

  @nested_components chat_preferences: ExStreamClient.Model.ChatPreferencesResponse,
                     disabled_until: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          chat_level: String.t() | nil,
          chat_preferences: ExStreamClient.Model.ChatPreferencesResponse.t() | nil,
          disabled_until: (DateTime.t() | integer() | String.t()) | nil
        }
end
