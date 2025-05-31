defmodule ExStreamClient.Model.FlagRequest do
  @moduledoc "Schema representing a FlagRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
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

  @nested_components moderation_payload: ExStreamClient.Model.ModerationPayload,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: %{optional(String.t()) => any()} | nil,
          entity_creator_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          reason: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
