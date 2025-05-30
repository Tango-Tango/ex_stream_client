defmodule ExStreamClient.Model.MessageModerationResult do
  @moduledoc "Schema representing a MessageModerationResult"
  use ExStreamClient.Jason
  @enforce_keys [:action, :created_at, :message_id, :updated_at, :user_bad_karma, :user_karma]
  defstruct [
    :action,
    :ai_moderation_response,
    :blocked_word,
    :blocklist_name,
    :created_at,
    :message_id,
    :moderated_by,
    :moderation_thresholds,
    :updated_at,
    :user_bad_karma,
    :user_karma
  ]

  @nested_components %{
    ai_moderation_response: ExStreamClient.Model.ModerationResponse,
    moderation_thresholds: ExStreamClient.Model.Thresholds
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: String.t(),
          ai_moderation_response: ExStreamClient.Model.ModerationResponse.t() | nil,
          blocked_word: String.t() | nil,
          blocklist_name: String.t() | nil,
          created_at: float(),
          message_id: String.t(),
          moderated_by: String.t() | nil,
          moderation_thresholds: ExStreamClient.Model.Thresholds.t() | nil,
          updated_at: float(),
          user_bad_karma: boolean(),
          user_karma: float()
        }
end
