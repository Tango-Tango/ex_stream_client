defmodule ExStreamClient.Model.Message do
  @moduledoc "Schema representing a Message"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :attachments,
    :cid,
    :created_at,
    :custom,
    :deleted_reply_count,
    :html,
    :id,
    :latest_reactions,
    :mentioned_users,
    :own_reactions,
    :pinned,
    :reaction_counts,
    :reaction_groups,
    :reaction_scores,
    :reply_count,
    :restricted_visibility,
    :shadowed,
    :silent,
    :text,
    :type,
    :updated_at
  ]
  defstruct [
    :attachments,
    :before_message_send_failed,
    :cid,
    :command,
    :created_at,
    :custom,
    :deleted_at,
    :deleted_reply_count,
    :html,
    :i18n,
    :id,
    :image_labels,
    :latest_reactions,
    :mentioned_users,
    :message_text_updated_at,
    :mml,
    :moderation,
    :own_reactions,
    :parent_id,
    :pin_expires,
    :pinned,
    :pinned_at,
    :pinned_by,
    :poll,
    :poll_id,
    :quoted_message,
    :quoted_message_id,
    :reaction_counts,
    :reaction_groups,
    :reaction_scores,
    :reply_count,
    :restricted_visibility,
    :shadowed,
    :show_in_channel,
    :silent,
    :text,
    :thread_participants,
    :type,
    :updated_at,
    :user
  ]

  @nested_components attachments: ExStreamClient.Model.Attachment,
                     created_at: :datetime,
                     deleted_at: :datetime,
                     latest_reactions: ExStreamClient.Model.Reaction,
                     mentioned_users: ExStreamClient.Model.User,
                     message_text_updated_at: :datetime,
                     moderation: ExStreamClient.Model.ModerationV2Response,
                     own_reactions: ExStreamClient.Model.Reaction,
                     pin_expires: :datetime,
                     pinned_at: :datetime,
                     pinned_by: ExStreamClient.Model.User,
                     poll: ExStreamClient.Model.Poll,
                     quoted_message: ExStreamClient.Model.Message,
                     reaction_groups: {:map, ExStreamClient.Model.ReactionGroupResponse},
                     thread_participants: ExStreamClient.Model.User,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: [ExStreamClient.Model.Attachment.t()],
          before_message_send_failed: boolean() | nil,
          cid: String.t(),
          command: String.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          deleted_reply_count: integer(),
          html: String.t(),
          i18n: %{optional(String.t()) => String.t()} | nil,
          id: String.t(),
          image_labels: %{optional(String.t()) => [String.t()]} | nil,
          latest_reactions: [ExStreamClient.Model.Reaction.t()],
          mentioned_users: [ExStreamClient.Model.User.t()],
          message_text_updated_at: (DateTime.t() | integer() | String.t()) | nil,
          mml: String.t() | nil,
          moderation: ExStreamClient.Model.ModerationV2Response.t() | nil,
          own_reactions: [ExStreamClient.Model.Reaction.t()],
          parent_id: String.t() | nil,
          pin_expires: (DateTime.t() | integer() | String.t()) | nil,
          pinned: boolean(),
          pinned_at: (DateTime.t() | integer() | String.t()) | nil,
          pinned_by: ExStreamClient.Model.User.t() | nil,
          poll: ExStreamClient.Model.Poll.t() | nil,
          poll_id: String.t() | nil,
          quoted_message: ExStreamClient.Model.Message.t() | nil,
          quoted_message_id: String.t() | nil,
          reaction_counts: %{optional(String.t()) => integer()},
          reaction_groups: %{
            optional(String.t()) => ExStreamClient.Model.ReactionGroupResponse.t()
          },
          reaction_scores: %{optional(String.t()) => integer()},
          reply_count: integer(),
          restricted_visibility: [String.t()],
          shadowed: boolean(),
          show_in_channel: boolean() | nil,
          silent: boolean(),
          text: String.t(),
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          type: String.t(),
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
