defmodule ExStreamClient.Model.SubmitActionRequest do
  @moduledoc "Schema representing a SubmitActionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action_type, :item_id]
  defstruct [
    :action_type,
    :ban,
    :custom,
    :delete_activity,
    :delete_message,
    :delete_reaction,
    :delete_user,
    :item_id,
    :mark_reviewed,
    :unban,
    :user,
    :user_id
  ]

  @nested_components action_type: :atom,
                     ban: ExStreamClient.Model.BanActionRequest,
                     custom: ExStreamClient.Model.CustomActionRequest,
                     delete_activity: ExStreamClient.Model.DeleteActivityRequest,
                     delete_message: ExStreamClient.Model.DeleteMessageRequest,
                     delete_reaction: ExStreamClient.Model.DeleteReactionRequest,
                     delete_user: ExStreamClient.Model.DeleteUserRequest,
                     mark_reviewed: ExStreamClient.Model.MarkReviewedRequest,
                     unban: ExStreamClient.Model.UnbanActionRequest,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
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
          ban: ExStreamClient.Model.BanActionRequest.t() | nil,
          custom: ExStreamClient.Model.CustomActionRequest.t() | nil,
          delete_activity: ExStreamClient.Model.DeleteActivityRequest.t() | nil,
          delete_message: ExStreamClient.Model.DeleteMessageRequest.t() | nil,
          delete_reaction: ExStreamClient.Model.DeleteReactionRequest.t() | nil,
          delete_user: ExStreamClient.Model.DeleteUserRequest.t() | nil,
          item_id: String.t(),
          mark_reviewed: ExStreamClient.Model.MarkReviewedRequest.t() | nil,
          unban: ExStreamClient.Model.UnbanActionRequest.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
