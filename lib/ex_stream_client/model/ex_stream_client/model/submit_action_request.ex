defmodule ExStreamClient.Model.SubmitActionRequest do
  @moduledoc "Schema representing a SubmitActionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:action_type, :item_id]
  defstruct [
    :user,
    :custom,
    :mark_reviewed,
    :delete_message,
    :delete_activity,
    :delete_reaction,
    :ban,
    :unban,
    :delete_user,
    :user_id,
    :action_type,
    :item_id
  ]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          custom: ExStreamClient.Model.CustomActionRequest.t() | nil,
          mark_reviewed: ExStreamClient.Model.MarkReviewedRequest.t() | nil,
          delete_message: ExStreamClient.Model.DeleteMessageRequest.t() | nil,
          delete_activity: ExStreamClient.Model.DeleteActivityRequest.t() | nil,
          delete_reaction: ExStreamClient.Model.DeleteReactionRequest.t() | nil,
          ban: ExStreamClient.Model.BanActionRequest.t() | nil,
          unban: ExStreamClient.Model.UnbanActionRequest.t() | nil,
          delete_user: ExStreamClient.Model.DeleteUserRequest.t() | nil,
          user_id: String.t() | nil,
          action_type:
            :end_call
            | :kick_user
            | :shadow_block
            | :unblock
            | :delete_user
            | :restore
            | :unban
            | :custom
            | :ban
            | :delete_reaction
            | :delete_activity
            | :delete_message
            | :mark_reviewed,
          item_id: String.t()
        }
end