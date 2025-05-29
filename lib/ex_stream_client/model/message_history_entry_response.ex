defmodule ExStreamClient.Model.MessageHistoryEntryResponse do
  @moduledoc "Schema representing a MessageHistoryEntryResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :custom,
    :attachments,
    :is_deleted,
    :message_id,
    :message_updated_at,
    :message_updated_by_id,
    :text
  ]
  defstruct [
    :text,
    :custom,
    :attachments,
    :message_id,
    :is_deleted,
    :message_updated_at,
    :message_updated_by_id
  ]

  @type t :: %__MODULE__{
          text: String.t(),
          custom: map(),
          attachments: [ExStreamClient.Model.Attachment.t()],
          message_id: String.t(),
          is_deleted: boolean(),
          message_updated_at: float(),
          message_updated_by_id: String.t()
        }
end