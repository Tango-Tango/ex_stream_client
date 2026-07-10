defmodule ExStreamClient.Model.VelocityFilterConfig do
  @moduledoc "Schema representing a VelocityFilterConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :advanced_filters,
    :async,
    :cascading_actions,
    :cids_per_user,
    :enabled,
    :first_message_only,
    :rules
  ]

  @nested_components rules: ExStreamClient.Model.VelocityFilterConfigRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          advanced_filters: boolean() | nil,
          async: boolean() | nil,
          cascading_actions: boolean() | nil,
          cids_per_user: integer() | nil,
          enabled: boolean() | nil,
          first_message_only: boolean() | nil,
          rules: [ExStreamClient.Model.VelocityFilterConfigRule.t()] | nil
        }
end
