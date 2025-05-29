defmodule ExStreamClient.Model.DraftResponse do
  @moduledoc "Schema representing a DraftResponse"
  use ExStreamClient.Jason
  @enforce_keys [:channel_cid, :created_at, :message]
  defstruct [
    :channel,
    :channel_cid,
    :created_at,
    :message,
    :parent_id,
    :parent_message,
    :quoted_message
  ]

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_cid: String.t(),
          created_at: float(),
          message: ExStreamClient.Model.DraftPayloadResponse.t(),
          parent_id: String.t() | nil,
          parent_message: ExStreamClient.Model.MessageResponse.t() | nil,
          quoted_message: ExStreamClient.Model.MessageResponse.t() | nil
        }
end