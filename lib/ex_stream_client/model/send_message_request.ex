defmodule ExStreamClient.Model.SendMessageRequest do
  @moduledoc "Schema representing a SendMessageRequest"
  use ExStreamClient.Jason
  @enforce_keys [:message]
  defstruct [
    :force_moderation,
    :keep_channel_hidden,
    :message,
    :pending,
    :pending_message_metadata,
    :skip_enrich_url,
    :skip_push
  ]

  @type t :: %__MODULE__{
          force_moderation: boolean() | nil,
          keep_channel_hidden: boolean() | nil,
          message: ExStreamClient.Model.MessageRequest.t(),
          pending: boolean() | nil,
          pending_message_metadata: map() | nil,
          skip_enrich_url: boolean() | nil,
          skip_push: boolean() | nil
        }
end