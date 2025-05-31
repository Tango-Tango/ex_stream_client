defmodule ExStreamClient.Model.CallSession do
  @moduledoc "Schema representing a CallSession"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :accepted_by,
    :active_sf_us,
    :anonymous_participant_count,
    :app_pk,
    :call_id,
    :call_type,
    :created_at,
    :missed_by,
    :participants,
    :participants_count_by_role,
    :rejected_by,
    :session_id,
    :sfui_ds,
    :user_permission_overrides
  ]
  defstruct [
    :accepted_by,
    :active_sf_us,
    :anonymous_participant_count,
    :app_pk,
    :call_id,
    :call_type,
    :created_at,
    :deleted_at,
    :ended_at,
    :live_ended_at,
    :live_started_at,
    :missed_by,
    :participants,
    :participants_count_by_role,
    :rejected_by,
    :ring_at,
    :session_id,
    :sfui_ds,
    :started_at,
    :timer_ends_at,
    :user_permission_overrides
  ]

  @nested_components active_sf_us: ExStreamClient.Model.SFUIDLastSeen,
                     participants: ExStreamClient.Model.CallParticipant
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          accepted_by: %{optional(String.t()) => float()},
          active_sf_us: [ExStreamClient.Model.SFUIDLastSeen.t()],
          anonymous_participant_count: integer(),
          app_pk: integer(),
          call_id: String.t(),
          call_type: String.t(),
          created_at: float(),
          deleted_at: float() | nil,
          ended_at: float() | nil,
          live_ended_at: float() | nil,
          live_started_at: float() | nil,
          missed_by: %{optional(String.t()) => float()},
          participants: [ExStreamClient.Model.CallParticipant.t()],
          participants_count_by_role: %{optional(String.t()) => integer()},
          rejected_by: %{optional(String.t()) => float()},
          ring_at: float() | nil,
          session_id: String.t(),
          sfui_ds: [String.t()],
          started_at: float() | nil,
          timer_ends_at: float() | nil,
          user_permission_overrides: %{
            optional(String.t()) => %{optional(String.t()) => boolean()}
          }
        }
end
