defmodule ExStreamClient.Model.CallSessionResponse do
  @moduledoc "Schema representing a CallSessionResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

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
    :accepted_by,
    :anonymous_participant_count,
    :ended_at,
    :id,
    :live_ended_at,
    :live_started_at,
    :missed_by,
    :participants,
    :participants_count_by_role,
    :rejected_by,
    :started_at,
    :timer_ends_at
  ]

  @nested_components participants: ExStreamClient.Model.CallParticipantResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          accepted_by: map(),
          anonymous_participant_count: integer(),
          ended_at: float() | nil,
          id: String.t(),
          live_ended_at: float() | nil,
          live_started_at: float() | nil,
          missed_by: map(),
          participants: [ExStreamClient.Model.CallParticipantResponse.t()],
          participants_count_by_role: map(),
          rejected_by: map(),
          started_at: float() | nil,
          timer_ends_at: float() | nil
        }
end
