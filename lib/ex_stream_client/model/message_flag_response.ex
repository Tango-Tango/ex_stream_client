defmodule ExStreamClient.Model.MessageFlagResponse do
  @moduledoc "Schema representing a MessageFlagResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :created_by_automod, :updated_at]
  defstruct [
    :approved_at,
    :created_at,
    :created_by_automod,
    :custom,
    :details,
    :message,
    :moderation_feedback,
    :moderation_result,
    :reason,
    :rejected_at,
    :reviewed_at,
    :reviewed_by,
    :updated_at,
    :user
  ]

  @type t :: %__MODULE__{
          approved_at: float() | nil,
          created_at: float(),
          created_by_automod: boolean(),
          custom: map() | nil,
          details: ExStreamClient.Model.FlagDetails.t() | nil,
          message: ExStreamClient.Model.Message.t() | nil,
          moderation_feedback: ExStreamClient.Model.FlagFeedback.t() | nil,
          moderation_result: ExStreamClient.Model.MessageModerationResult.t() | nil,
          reason: String.t() | nil,
          rejected_at: float() | nil,
          reviewed_at: float() | nil,
          reviewed_by: ExStreamClient.Model.UserResponse.t() | nil,
          updated_at: float(),
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end