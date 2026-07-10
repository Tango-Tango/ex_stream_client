defmodule ExStreamClient.Model.OverviewDashboardConfig do
  @moduledoc "Schema representing a OverviewDashboardConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:default_date_range_days, :visible_charts]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          default_date_range_days: integer() | nil,
          visible_charts: [String.t()] | nil
        }
end
