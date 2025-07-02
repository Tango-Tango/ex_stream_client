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

  @nested_components ended_at: :datetime,
                     live_ended_at: :datetime,
                     live_started_at: :datetime,
                     participants: ExStreamClient.Model.CallParticipantResponse,
                     started_at: :datetime,
                     timer_ends_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          accepted_by: %{optional(String.t()) => DateTime.t() | integer() | String.t()},
          anonymous_participant_count: integer(),
          ended_at: (DateTime.t() | integer() | String.t()) | nil,
          id: String.t(),
          live_ended_at: (DateTime.t() | integer() | String.t()) | nil,
          live_started_at: (DateTime.t() | integer() | String.t()) | nil,
          missed_by: %{optional(String.t()) => DateTime.t() | integer() | String.t()},
          participants: [ExStreamClient.Model.CallParticipantResponse.t()],
          participants_count_by_role: %{optional(String.t()) => integer()},
          rejected_by: %{optional(String.t()) => DateTime.t() | integer() | String.t()},
          started_at: (DateTime.t() | integer() | String.t()) | nil,
          timer_ends_at: (DateTime.t() | integer() | String.t()) | nil
        }
end
