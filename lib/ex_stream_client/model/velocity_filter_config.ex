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
    :advanced_filters,
    :async,
    :cascading_actions,
    :cids_per_user,
    :enabled,
    :first_message_only,
    :rules
  ]

  @nested_components %{rules: ExStreamClient.Model.VelocityFilterConfigRule}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          advanced_filters: boolean(),
          async: boolean() | nil,
          cascading_actions: boolean(),
          cids_per_user: integer(),
          enabled: boolean(),
          first_message_only: boolean(),
          rules: [ExStreamClient.Model.VelocityFilterConfigRule.t()]
        }
end
