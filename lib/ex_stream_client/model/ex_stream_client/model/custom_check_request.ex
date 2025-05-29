defmodule ExStreamClient.Model.CustomCheckRequest do
  @moduledoc "Schema representing a CustomCheckRequest"
  use ExStreamClient.Jason
  @enforce_keys [:entity_id, :entity_type, :flags]
  defstruct [
    :flags,
    :user,
    :user_id,
    :entity_id,
    :entity_type,
    :entity_creator_id,
    :moderation_payload
  ]

  @type t :: %__MODULE__{
          flags: [ExStreamClient.Model.CustomCheckFlag.t()],
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          entity_creator_id: String.t() | nil,
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil
        }
end