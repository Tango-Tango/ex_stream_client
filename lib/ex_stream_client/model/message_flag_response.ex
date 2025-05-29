defmodule ExStreamClient.Model.MessageFlagResponse do
  @moduledoc "Schema representing a MessageFlagResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :created_by_automod, :updated_at]
  defstruct [
    :message,
    :reason,
    :user,
    :details,
    :custom,
    :created_at,
    :updated_at,
    :created_by_automod,
    :approved_at,
    :moderation_feedback,
    :moderation_result,
    :rejected_at,
    :reviewed_at,
    :reviewed_by
  ]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.Message.t() | nil,
          reason: String.t() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil,
          details: ExStreamClient.Model.FlagDetails.t() | nil,
          custom: map() | nil,
          created_at: float(),
          updated_at: float(),
          created_by_automod: boolean(),
          approved_at: float() | nil,
          moderation_feedback: ExStreamClient.Model.FlagFeedback.t() | nil,
          moderation_result: ExStreamClient.Model.MessageModerationResult.t() | nil,
          rejected_at: float() | nil,
          reviewed_at: float() | nil,
          reviewed_by: ExStreamClient.Model.UserResponse.t() | nil
        }
end