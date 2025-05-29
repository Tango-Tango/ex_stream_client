defmodule ExStreamClient.Model.CallSessionResponse do
  @moduledoc "Schema representing a CallSessionResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :accepted_by,
    :anonymous_participant_count,
    :id,
    :missed_by,
    :participants,
    :participants_count_by_role,
    :rejected_by
  ]
  defstruct [
    :id,
    :started_at,
    :accepted_by,
    :anonymous_participant_count,
    :missed_by,
    :participants,
    :participants_count_by_role,
    :rejected_by,
    :ended_at,
    :live_ended_at,
    :live_started_at,
    :timer_ends_at
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          started_at: float() | nil,
          accepted_by: map(),
          anonymous_participant_count: integer(),
          missed_by: map(),
          participants: [ExStreamClient.Model.CallParticipantResponse.t()],
          participants_count_by_role: map(),
          rejected_by: map(),
          ended_at: float() | nil,
          live_ended_at: float() | nil,
          live_started_at: float() | nil,
          timer_ends_at: float() | nil
        }
end