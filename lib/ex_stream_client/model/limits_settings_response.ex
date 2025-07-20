defmodule ExStreamClient.Model.LimitsSettingsResponse do
  @moduledoc "Schema representing a LimitsSettingsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:max_participants_exclude_roles]
  defstruct [
    :max_duration_seconds,
    :max_participants,
    :max_participants_exclude_owner,
    :max_participants_exclude_roles
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          max_duration_seconds: integer() | nil,
          max_participants: integer() | nil,
          max_participants_exclude_owner: boolean() | nil,
          max_participants_exclude_roles: [String.t()]
        }
end
