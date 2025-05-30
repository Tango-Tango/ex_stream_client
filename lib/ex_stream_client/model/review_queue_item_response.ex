defmodule ExStreamClient.Model.ReviewQueueItemResponse do
  @moduledoc "Schema representing a ReviewQueueItemResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :actions,
    :ai_text_severity,
    :bans,
    :created_at,
    :entity_id,
    :entity_type,
    :flags,
    :flags_count,
    :id,
    :languages,
    :recommended_action,
    :reviewed_by,
    :severity,
    :status,
    :updated_at
  ]
  defstruct [
    :actions,
    :activity,
    :ai_text_severity,
    :assigned_to,
    :bans,
    :call,
    :completed_at,
    :config_key,
    :created_at,
    :entity_creator,
    :entity_creator_id,
    :entity_id,
    :entity_type,
    :feeds_v2_activity,
    :feeds_v2_reaction,
    :flags,
    :flags_count,
    :id,
    :languages,
    :message,
    :moderation_payload,
    :reaction,
    :recommended_action,
    :reviewed_at,
    :reviewed_by,
    :severity,
    :status,
    :teams,
    :updated_at
  ]

  @nested_components %{
    call: ExStreamClient.Model.CallResponse,
    flags: ExStreamClient.Model.FlagResponse,
    message: ExStreamClient.Model.MessageResponse,
    actions: ExStreamClient.Model.ActionLogResponse,
    moderation_payload: ExStreamClient.Model.ModerationPayload,
    reaction: ExStreamClient.Model.Reaction,
    bans: ExStreamClient.Model.Ban,
    activity: ExStreamClient.Model.EnrichedActivity,
    assigned_to: ExStreamClient.Model.UserResponse,
    entity_creator: ExStreamClient.Model.EntityCreatorResponse,
    feeds_v2_activity: ExStreamClient.Model.EnrichedActivity,
    feeds_v2_reaction: ExStreamClient.Model.Reaction
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          actions: [ExStreamClient.Model.ActionLogResponse.t()],
          activity: ExStreamClient.Model.EnrichedActivity.t() | nil,
          ai_text_severity: String.t(),
          assigned_to: ExStreamClient.Model.UserResponse.t() | nil,
          bans: [ExStreamClient.Model.Ban.t()],
          call: ExStreamClient.Model.CallResponse.t() | nil,
          completed_at: float() | nil,
          config_key: String.t() | nil,
          created_at: float(),
          entity_creator: ExStreamClient.Model.EntityCreatorResponse.t() | nil,
          entity_creator_id: String.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          feeds_v2_activity: ExStreamClient.Model.EnrichedActivity.t() | nil,
          feeds_v2_reaction: ExStreamClient.Model.Reaction.t() | nil,
          flags: [ExStreamClient.Model.FlagResponse.t()],
          flags_count: integer(),
          id: String.t(),
          languages: [String.t()],
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          moderation_payload: ExStreamClient.Model.ModerationPayload.t() | nil,
          reaction: ExStreamClient.Model.Reaction.t() | nil,
          recommended_action: String.t(),
          reviewed_at: float() | nil,
          reviewed_by: String.t(),
          severity: integer(),
          status: String.t(),
          teams: [String.t()] | nil,
          updated_at: float()
        }
end
