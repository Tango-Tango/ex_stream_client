defmodule ExStreamClient.Model.CustomCheckRequest do
  @moduledoc "Schema representing a CustomCheckRequest"
  use ExStreamClient.Jason
  @enforce_keys [:entity_id, :entity_type, :flags]
  defstruct [
    :entity_creator_id,
    :entity_id,
    :entity_type,
    :flags,
    :moderation_payload,
    :user,
    :user_id
  ]

  @type t :: %__MODULE__{
          entity_creator_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          flags: [ExStreamClient.Model.CustomCheckFlag.t()],
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end