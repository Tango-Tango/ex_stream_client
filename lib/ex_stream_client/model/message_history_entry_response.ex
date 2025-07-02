defmodule ExStreamClient.Model.MessageHistoryEntryResponse do
  @moduledoc "Schema representing a MessageHistoryEntryResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :attachments,
    :custom,
    :is_deleted,
    :message_id,
    :message_updated_at,
    :message_updated_by_id,
    :text
  ]
  defstruct [
    :attachments,
    :custom,
    :is_deleted,
    :message_id,
    :message_updated_at,
    :message_updated_by_id,
    :text
  ]

  @nested_components attachments: ExStreamClient.Model.Attachment, message_updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: [ExStreamClient.Model.Attachment.t()],
          custom: %{optional(String.t()) => any()},
          is_deleted: boolean(),
          message_id: String.t(),
          message_updated_at: DateTime.t() | integer() | String.t(),
          message_updated_by_id: String.t(),
          text: String.t()
        }
end
