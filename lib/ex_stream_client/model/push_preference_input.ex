defmodule ExStreamClient.Model.PushPreferenceInput do
  @moduledoc "Schema representing a PushPreferenceInput"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :call_level,
    :channel_cid,
    :chat_level,
    :chat_preferences,
    :disabled_until,
    :feeds_level,
    :feeds_preferences,
    :remove_disable,
    :user_id
  ]

  @nested_components call_level: :enum,
                     chat_level: :enum,
                     chat_preferences: ExStreamClient.Model.ChatPreferencesInput,
                     disabled_until: :datetime,
                     feeds_level: :enum,
                     feeds_preferences: ExStreamClient.Model.FeedsPreferences
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          call_level: (:default | :none | :all) | nil,
          channel_cid: String.t() | nil,
          chat_level:
            (:default | :none | :all_mentions | :direct_mentions | :mentions | :all) | nil,
          chat_preferences: ExStreamClient.Model.ChatPreferencesInput.t() | nil,
          disabled_until: (DateTime.t() | integer() | String.t()) | nil,
          feeds_level: (:default | :none | :all) | nil,
          feeds_preferences: ExStreamClient.Model.FeedsPreferences.t() | nil,
          remove_disable: boolean() | nil,
          user_id: String.t() | nil
        }
end
