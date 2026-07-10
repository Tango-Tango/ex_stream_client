defmodule ExStreamClient.Model.SubmitActionRequest do
  @moduledoc "Schema representing a SubmitActionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action_type]
  defstruct [
    :action_type,
    :appeal_id,
    :ban,
    :block,
    :bypass,
    :custom,
    :delete_activity,
    :delete_comment,
    :delete_message,
    :delete_reaction,
    :delete_user,
    :escalate,
    :flag,
    :item_id,
    :mark_reviewed,
    :reject_appeal,
    :restore,
    :shadow_block,
    :unban,
    :unblock,
    :user,
    :user_id
  ]

  @nested_components action_type: :enum,
                     ban: ExStreamClient.Model.BanActionRequestPayload,
                     block: ExStreamClient.Model.BlockActionRequestPayload,
                     bypass: ExStreamClient.Model.BypassActionRequest,
                     custom: ExStreamClient.Model.CustomActionRequestPayload,
                     delete_activity: ExStreamClient.Model.DeleteActivityRequestPayload,
                     delete_comment: ExStreamClient.Model.DeleteCommentRequestPayload,
                     delete_message: ExStreamClient.Model.DeleteMessageRequestPayload,
                     delete_reaction: ExStreamClient.Model.DeleteReactionRequestPayload,
                     delete_user: ExStreamClient.Model.DeleteUserRequestPayload,
                     escalate: ExStreamClient.Model.EscalatePayload,
                     flag: ExStreamClient.Model.FlagRequest,
                     mark_reviewed: ExStreamClient.Model.MarkReviewedRequestPayload,
                     reject_appeal: ExStreamClient.Model.RejectAppealRequestPayload,
                     restore: ExStreamClient.Model.RestoreActionRequestPayload,
                     shadow_block: ExStreamClient.Model.ShadowBlockActionRequestPayload,
                     unban: ExStreamClient.Model.UnbanActionRequestPayload,
                     unblock: ExStreamClient.Model.UnblockActionRequestPayload,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_type:
            :bypass
            | :de_escalate
            | :escalate
            | :reject_appeal
            | :end_call
            | :kick_user
            | :unmask
            | :shadow_block
            | :block
            | :unblock
            | :delete_user
            | :restore
            | :unban
            | :custom
            | :ban
            | :delete_reaction
            | :delete_comment
            | :delete_activity
            | :delete_message
            | :mark_reviewed
            | :flag,
          appeal_id: String.t() | nil,
          ban: ExStreamClient.Model.BanActionRequestPayload.t() | nil,
          block: ExStreamClient.Model.BlockActionRequestPayload.t() | nil,
          bypass: ExStreamClient.Model.BypassActionRequest.t() | nil,
          custom: ExStreamClient.Model.CustomActionRequestPayload.t() | nil,
          delete_activity: ExStreamClient.Model.DeleteActivityRequestPayload.t() | nil,
          delete_comment: ExStreamClient.Model.DeleteCommentRequestPayload.t() | nil,
          delete_message: ExStreamClient.Model.DeleteMessageRequestPayload.t() | nil,
          delete_reaction: ExStreamClient.Model.DeleteReactionRequestPayload.t() | nil,
          delete_user: ExStreamClient.Model.DeleteUserRequestPayload.t() | nil,
          escalate: ExStreamClient.Model.EscalatePayload.t() | nil,
          flag: ExStreamClient.Model.FlagRequest.t() | nil,
          item_id: String.t() | nil,
          mark_reviewed: ExStreamClient.Model.MarkReviewedRequestPayload.t() | nil,
          reject_appeal: ExStreamClient.Model.RejectAppealRequestPayload.t() | nil,
          restore: ExStreamClient.Model.RestoreActionRequestPayload.t() | nil,
          shadow_block: ExStreamClient.Model.ShadowBlockActionRequestPayload.t() | nil,
          unban: ExStreamClient.Model.UnbanActionRequestPayload.t() | nil,
          unblock: ExStreamClient.Model.UnblockActionRequestPayload.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
