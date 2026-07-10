defmodule ExStreamClient.Model.PushPreferencesResponse do
  @moduledoc "Schema representing a PushPreferencesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :call_level,
    :chat_level,
    :chat_preferences,
    :disabled_until,
    :feeds_level,
    :feeds_preferences
  ]

  @nested_components chat_preferences: ExStreamClient.Model.ChatPreferencesResponse,
                     disabled_until: :datetime,
                     feeds_preferences: ExStreamClient.Model.FeedsPreferencesResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          call_level: String.t() | nil,
          chat_level: String.t() | nil,
          chat_preferences: ExStreamClient.Model.ChatPreferencesResponse.t() | nil,
          disabled_until: (DateTime.t() | integer() | String.t()) | nil,
          feeds_level: String.t() | nil,
          feeds_preferences: ExStreamClient.Model.FeedsPreferencesResponse.t() | nil
        }
end
