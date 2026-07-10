defmodule ExStreamClient.Model.ModerationDashboardPreferences do
  @moduledoc "Schema representing a ModerationDashboardPreferences"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :allowed_moderation_action_reasons,
    :async_review_queue_upsert,
    :disable_audit_logs,
    :disable_flagging_reviewed_entity,
    :escalation_queue_enabled,
    :escalation_reasons,
    :flag_user_on_flagged_content,
    :include_attachment_payload,
    :keyframe_classifications_map,
    :media_queue_blur_enabled,
    :overview_dashboard
  ]

  @nested_components overview_dashboard: ExStreamClient.Model.OverviewDashboardConfig
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          allowed_moderation_action_reasons: [String.t()] | nil,
          async_review_queue_upsert: boolean() | nil,
          disable_audit_logs: boolean() | nil,
          disable_flagging_reviewed_entity: boolean() | nil,
          escalation_queue_enabled: boolean() | nil,
          escalation_reasons: [String.t()] | nil,
          flag_user_on_flagged_content: boolean() | nil,
          include_attachment_payload: boolean() | nil,
          keyframe_classifications_map:
            %{optional(String.t()) => %{optional(String.t()) => boolean()}} | nil,
          media_queue_blur_enabled: boolean() | nil,
          overview_dashboard: ExStreamClient.Model.OverviewDashboardConfig.t() | nil
        }
end
