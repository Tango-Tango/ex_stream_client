defmodule ExStreamClient.Model.MetricStats do
  @moduledoc "Schema representing a MetricStats"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:total]
  defstruct [:daily, :total]
  @nested_components daily: ExStreamClient.Model.DailyValue
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{daily: [ExStreamClient.Model.DailyValue.t()] | nil, total: integer()}
end
