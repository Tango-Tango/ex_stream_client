defmodule ExStreamClient.Model.MessageModerationResult do
  @moduledoc "Schema representing a MessageModerationResult"
  use ExStreamClient.Jason
  @enforce_keys [:action, :created_at, :message_id, :updated_at, :user_bad_karma, :user_karma]
  defstruct [
    :action,
    :created_at,
    :updated_at,
    :message_id,
    :user_bad_karma,
    :user_karma,
    :ai_moderation_response,
    :blocked_word,
    :blocklist_name,
    :moderated_by,
    :moderation_thresholds
  ]

  @type t :: %__MODULE__{
          action: String.t(),
          created_at: float(),
          updated_at: float(),
          message_id: String.t(),
          user_bad_karma: boolean(),
          user_karma: float(),
          ai_moderation_response: ExStreamClient.Model.ModerationResponse.t() | nil,
          blocked_word: String.t() | nil,
          blocklist_name: String.t() | nil,
          moderated_by: String.t() | nil,
          moderation_thresholds: ExStreamClient.Model.Thresholds.t() | nil
        }
end