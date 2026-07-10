defmodule ExStreamClient.Model.ChatDraftResponse do
  @moduledoc "Schema representing a ChatDraftResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_cid, :created_at, :message]
  defstruct [:channel_cid, :created_at, :message, :parent_id, :parent_message, :quoted_message]

  @nested_components created_at: :datetime,
                     message: ExStreamClient.Model.ChatDraftPayloadResponse,
                     parent_message: ExStreamClient.Model.ChatMessageResponse,
                     quoted_message: ExStreamClient.Model.ChatMessageResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          message: ExStreamClient.Model.ChatDraftPayloadResponse.t(),
          parent_id: String.t() | nil,
          parent_message: ExStreamClient.Model.ChatMessageResponse.t() | nil,
          quoted_message: ExStreamClient.Model.ChatMessageResponse.t() | nil
        }
end
