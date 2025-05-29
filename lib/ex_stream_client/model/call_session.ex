defmodule ExStreamClient.Model.CallSession do
  @moduledoc "Schema representing a CallSession"
  use ExStreamClient.Jason

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
    :sfui_ds,
    :session_id,
    :user_permission_overrides
  ]
  defstruct [
    :started_at,
    :call_type,
    :session_id,
    :created_at,
    :deleted_at,
    :accepted_by,
    :active_sf_us,
    :anonymous_participant_count,
    :app_pk,
    :call_id,
    :missed_by,
    :participants,
    :participants_count_by_role,
    :rejected_by,
    :sfui_ds,
    :user_permission_overrides,
    :ended_at,
    :live_ended_at,
    :live_started_at,
    :ring_at,
    :timer_ends_at
  ]

  @type t :: %__MODULE__{
          started_at: float() | nil,
          call_type: String.t(),
          session_id: String.t(),
          created_at: float(),
          deleted_at: float() | nil,
          accepted_by: map(),
          active_sf_us: [ExStreamClient.Model.SFUIDLastSeen.t()],
          anonymous_participant_count: integer(),
          app_pk: integer(),
          call_id: String.t(),
          missed_by: map(),
          participants: [ExStreamClient.Model.CallParticipant.t()],
          participants_count_by_role: map(),
          rejected_by: map(),
          sfui_ds: [String.t()],
          user_permission_overrides: map(),
          ended_at: float() | nil,
          live_ended_at: float() | nil,
          live_started_at: float() | nil,
          ring_at: float() | nil,
          timer_ends_at: float() | nil
        }
end