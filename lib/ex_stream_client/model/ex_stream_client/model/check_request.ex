defmodule ExStreamClient.Model.CheckRequest do
  @moduledoc "Schema representing a CheckRequest"
  use ExStreamClient.Jason
  @enforce_keys [:config_key, :entity_creator_id, :entity_id, :entity_type]
  defstruct [
    :user,
    :options,
    :user_id,
    :entity_id,
    :entity_type,
    :entity_creator_id,
    :moderation_payload,
    :config_key,
    :config_team,
    :test_mode
  ]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          options: map() | nil,
          user_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          entity_creator_id: String.t(),
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          config_key: String.t(),
          config_team: String.t() | nil,
          test_mode: boolean() | nil
        }
end