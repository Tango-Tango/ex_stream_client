defmodule ExStreamClient.Model.FlagRequest do
  @moduledoc "Schema representing a FlagRequest"
  use ExStreamClient.Jason
  @enforce_keys [:entity_id, :entity_type]
  defstruct [
    :reason,
    :user,
    :custom,
    :user_id,
    :entity_id,
    :entity_type,
    :entity_creator_id,
    :moderation_payload
  ]

  @type t :: %__MODULE__{
          reason: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          custom: map() | nil,
          user_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          entity_creator_id: String.t() | nil,
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil
        }
end