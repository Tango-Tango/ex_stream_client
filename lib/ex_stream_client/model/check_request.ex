defmodule ExStreamClient.Model.CheckRequest do
  @moduledoc "Schema representing a CheckRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:config_key, :entity_creator_id, :entity_id, :entity_type]
  defstruct [
    :config_key,
    :config_team,
    :entity_creator_id,
    :entity_id,
    :entity_type,
    :moderation_payload,
    :options,
    :test_mode,
    :user,
    :user_id
  ]

  @nested_components moderation_payload: ExStreamClient.Model.ModerationPayload,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          config_key: String.t(),
          config_team: String.t() | nil,
          entity_creator_id: String.t(),
          entity_id: String.t(),
          entity_type: String.t(),
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          options: %{optional(String.t()) => any()} | nil,
          test_mode: boolean() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
