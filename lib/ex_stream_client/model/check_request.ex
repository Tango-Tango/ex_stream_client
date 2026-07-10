defmodule ExStreamClient.Model.CheckRequest do
  @moduledoc "Schema representing a CheckRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:entity_creator_id, :entity_id, :entity_type]
  defstruct [
    :config,
    :config_key,
    :config_team,
    :content_published_at,
    :entity_creator_id,
    :entity_id,
    :entity_type,
    :moderation_payload,
    :options,
    :test_mode,
    :user,
    :user_id
  ]

  @nested_components config: ExStreamClient.Model.ModerationConfig,
                     content_published_at: :datetime,
                     moderation_payload: ExStreamClient.Model.ModerationPayload,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          config: ExStreamClient.Model.ModerationConfig.t() | nil,
          config_key: String.t() | nil,
          config_team: String.t() | nil,
          content_published_at: (DateTime.t() | integer() | String.t()) | nil,
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
