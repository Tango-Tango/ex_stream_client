defmodule ExStreamClient.Model.VelocityFilterConfig do
  @moduledoc "Schema representing a VelocityFilterConfig"
  use ExStreamClient.Jason

  @enforce_keys [
    :advanced_filters,
    :cascading_actions,
    :cids_per_user,
    :enabled,
    :first_message_only,
    :rules
  ]
  defstruct [
    :async,
    :enabled,
    :rules,
    :advanced_filters,
    :cascading_actions,
    :cids_per_user,
    :first_message_only
  ]

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean(),
          rules: [ExStreamClient.Model.VelocityFilterConfigRule.t()],
          advanced_filters: boolean(),
          cascading_actions: boolean(),
          cids_per_user: integer(),
          first_message_only: boolean()
        }
end