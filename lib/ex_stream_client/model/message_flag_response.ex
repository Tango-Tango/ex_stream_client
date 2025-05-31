defmodule ExStreamClient.Model.MessageFlagResponse do
  @moduledoc "Schema representing a MessageFlagResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
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

  @nested_components details: ExStreamClient.Model.FlagDetails,
                     message: ExStreamClient.Model.Message,
                     moderation_feedback: ExStreamClient.Model.FlagFeedback,
                     moderation_result: ExStreamClient.Model.MessageModerationResult,
                     reviewed_by: ExStreamClient.Model.UserResponse,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          approved_at: float() | nil,
          created_at: float(),
          created_by_automod: boolean(),
          custom: %{optional(String.t()) => any()} | nil,
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
