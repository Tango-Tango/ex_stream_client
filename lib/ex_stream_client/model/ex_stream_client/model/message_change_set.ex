defmodule ExStreamClient.Model.MessageChangeSet do
  @moduledoc "Schema representing a MessageChangeSet"
  use ExStreamClient.Jason

  @enforce_keys [
    :attachments,
    :custom,
    :html,
    :mentioned_user_ids,
    :mml,
    :pin,
    :quoted_message_id,
    :silent,
    :text
  ]
  defstruct [
    :silent,
    :text,
    :pin,
    :custom,
    :attachments,
    :html,
    :mentioned_user_ids,
    :mml,
    :quoted_message_id
  ]

  @type t :: %__MODULE__{
          silent: boolean(),
          text: boolean(),
          pin: boolean(),
          custom: boolean(),
          attachments: boolean(),
          html: boolean(),
          mentioned_user_ids: boolean(),
          mml: boolean(),
          quoted_message_id: boolean()
        }
end