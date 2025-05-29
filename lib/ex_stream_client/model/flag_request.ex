defmodule ExStreamClient.Model.FlagRequest do
  @moduledoc "Schema representing a FlagRequest"
  use ExStreamClient.Jason
  @enforce_keys [:entity_id, :entity_type]
  defstruct [
    :custom,
    :entity_creator_id,
    :entity_id,
    :entity_type,
    :moderation_payload,
    :reason,
    :user,
    :user_id
  ]

  @type t :: %__MODULE__{
          custom: map() | nil,
          entity_creator_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          reason: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end