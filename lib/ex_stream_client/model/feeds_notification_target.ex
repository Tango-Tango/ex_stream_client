defmodule ExStreamClient.Model.FeedsNotificationTarget do
  @moduledoc "Schema representing a FeedsNotificationTarget"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:id]
  defstruct [
    :attachments,
    :comment,
    :custom,
    :id,
    :name,
    :parent_activity,
    :text,
    :type,
    :user_id
  ]

  @nested_components attachments: ExStreamClient.Model.Attachment,
                     comment: ExStreamClient.Model.FeedsNotificationComment,
                     parent_activity: ExStreamClient.Model.FeedsNotificationParentActivity
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: [ExStreamClient.Model.Attachment.t()] | nil,
          comment: ExStreamClient.Model.FeedsNotificationComment.t() | nil,
          custom: %{optional(String.t()) => any()} | nil,
          id: String.t(),
          name: String.t() | nil,
          parent_activity: ExStreamClient.Model.FeedsNotificationParentActivity.t() | nil,
          text: String.t() | nil,
          type: String.t() | nil,
          user_id: String.t() | nil
        }
end
