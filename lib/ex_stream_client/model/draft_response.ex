defmodule ExStreamClient.Model.DraftResponse do
  @moduledoc "Schema representing a DraftResponse"
  use ExStreamClient.Jason
  @enforce_keys [:channel_cid, :created_at, :message]
  defstruct [
    :message,
    :channel,
    :created_at,
    :parent_id,
    :quoted_message,
    :channel_cid,
    :parent_message
  ]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.DraftPayloadResponse.t(),
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          created_at: float(),
          parent_id: String.t() | nil,
          quoted_message: ExStreamClient.Model.MessageResponse.t() | nil,
          channel_cid: String.t(),
          parent_message: ExStreamClient.Model.MessageResponse.t() | nil
        }
end