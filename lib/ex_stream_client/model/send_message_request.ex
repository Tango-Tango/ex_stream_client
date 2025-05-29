defmodule ExStreamClient.Model.SendMessageRequest do
  @moduledoc "Schema representing a SendMessageRequest"
  use ExStreamClient.Jason
  @enforce_keys [:message]
  defstruct [
    :message,
    :pending,
    :skip_push,
    :skip_enrich_url,
    :pending_message_metadata,
    :force_moderation,
    :keep_channel_hidden
  ]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageRequest.t(),
          pending: boolean() | nil,
          skip_push: boolean() | nil,
          skip_enrich_url: boolean() | nil,
          pending_message_metadata: map() | nil,
          force_moderation: boolean() | nil,
          keep_channel_hidden: boolean() | nil
        }
end