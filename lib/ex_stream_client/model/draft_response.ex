defmodule ExStreamClient.Model.DraftResponse do
  @moduledoc "Schema representing a DraftResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
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

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     created_at: :datetime,
                     message: ExStreamClient.Model.DraftPayloadResponse,
                     parent_message: ExStreamClient.Model.MessageResponse,
                     quoted_message: ExStreamClient.Model.MessageResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          message: ExStreamClient.Model.DraftPayloadResponse.t(),
          parent_id: String.t() | nil,
          parent_message: ExStreamClient.Model.MessageResponse.t() | nil,
          quoted_message: ExStreamClient.Model.MessageResponse.t() | nil
        }
end
