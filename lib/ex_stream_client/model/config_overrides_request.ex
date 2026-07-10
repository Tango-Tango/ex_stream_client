defmodule ExStreamClient.Model.ConfigOverridesRequest do
  @moduledoc "Schema representing a ConfigOverridesRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :blocklist,
    :blocklist_behavior,
    :chat_preferences,
    :commands,
    :count_messages,
    :grants,
    :max_message_length,
    :push_level,
    :quotes,
    :reactions,
    :replies,
    :shared_locations,
    :typing_events,
    :uploads,
    :url_enrichment,
    :user_message_reminders
  ]

  @nested_components blocklist_behavior: :enum,
                     chat_preferences: ExStreamClient.Model.ChatPreferences,
                     push_level: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocklist: String.t() | nil,
          blocklist_behavior: (:block | :flag) | nil,
          chat_preferences: ExStreamClient.Model.ChatPreferences.t() | nil,
          commands: [String.t()] | nil,
          count_messages: boolean() | nil,
          grants: %{optional(String.t()) => [String.t()]} | nil,
          max_message_length: integer() | nil,
          push_level: (:none | :direct_mentions | :mentions | :all_mentions | :all) | nil,
          quotes: boolean() | nil,
          reactions: boolean() | nil,
          replies: boolean() | nil,
          shared_locations: boolean() | nil,
          typing_events: boolean() | nil,
          uploads: boolean() | nil,
          url_enrichment: boolean() | nil,
          user_message_reminders: boolean() | nil
        }
end
