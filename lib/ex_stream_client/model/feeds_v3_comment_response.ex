defmodule ExStreamClient.Model.FeedsV3CommentResponse do
  @moduledoc "Schema representing a FeedsV3CommentResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :bookmark_count,
    :confidence_score,
    :created_at,
    :downvote_count,
    :id,
    :mentioned_users,
    :object_id,
    :object_type,
    :own_reactions,
    :reaction_count,
    :reply_count,
    :score,
    :status,
    :updated_at,
    :upvote_count,
    :user
  ]
  defstruct [
    :attachments,
    :bookmark_count,
    :confidence_score,
    :controversy_score,
    :created_at,
    :custom,
    :deleted_at,
    :downvote_count,
    :edited_at,
    :id,
    :latest_reactions,
    :mentioned_users,
    :moderation,
    :object_id,
    :object_type,
    :own_reactions,
    :parent_id,
    :reaction_count,
    :reaction_groups,
    :reply_count,
    :score,
    :status,
    :text,
    :updated_at,
    :upvote_count,
    :user
  ]

  @nested_components attachments: ExStreamClient.Model.Attachment,
                     created_at: :datetime,
                     deleted_at: :datetime,
                     edited_at: :datetime,
                     latest_reactions: ExStreamClient.Model.FeedsReactionResponse,
                     mentioned_users: ExStreamClient.Model.UserResponse,
                     moderation: ExStreamClient.Model.ModerationV2Response,
                     own_reactions: ExStreamClient.Model.FeedsReactionResponse,
                     reaction_groups: {:map, ExStreamClient.Model.FeedsReactionGroupResponse},
                     updated_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: [ExStreamClient.Model.Attachment.t()] | nil,
          bookmark_count: integer(),
          confidence_score: float(),
          controversy_score: float() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()} | nil,
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          downvote_count: integer(),
          edited_at: (DateTime.t() | integer() | String.t()) | nil,
          id: String.t(),
          latest_reactions: [ExStreamClient.Model.FeedsReactionResponse.t()] | nil,
          mentioned_users: [ExStreamClient.Model.UserResponse.t()],
          moderation: ExStreamClient.Model.ModerationV2Response.t() | nil,
          object_id: String.t(),
          object_type: String.t(),
          own_reactions: [ExStreamClient.Model.FeedsReactionResponse.t()],
          parent_id: String.t() | nil,
          reaction_count: integer(),
          reaction_groups:
            %{optional(String.t()) => ExStreamClient.Model.FeedsReactionGroupResponse.t()} | nil,
          reply_count: integer(),
          score: integer(),
          status: String.t(),
          text: String.t() | nil,
          updated_at: DateTime.t() | integer() | String.t(),
          upvote_count: integer(),
          user: ExStreamClient.Model.UserResponse.t()
        }
end
