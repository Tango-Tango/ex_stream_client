defmodule ExStreamClient.Model.SendMessageRequest do
  @moduledoc "Schema representing a SendMessageRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
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

  @nested_components message: ExStreamClient.Model.MessageRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          force_moderation: boolean() | nil,
          keep_channel_hidden: boolean() | nil,
          message: ExStreamClient.Model.MessageRequest.t(),
          pending: boolean() | nil,
          pending_message_metadata: %{optional(String.t()) => String.t()} | nil,
          skip_enrich_url: boolean() | nil,
          skip_push: boolean() | nil
        }
end
