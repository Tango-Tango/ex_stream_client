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

  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: boolean(),
          custom: boolean(),
          html: boolean(),
          mentioned_user_ids: boolean(),
          mml: boolean(),
          pin: boolean(),
          quoted_message_id: boolean(),
          silent: boolean(),
          text: boolean()
        }
end
