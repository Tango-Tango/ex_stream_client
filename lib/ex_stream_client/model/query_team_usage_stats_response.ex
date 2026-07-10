defmodule ExStreamClient.Model.QueryTeamUsageStatsResponse do
  @moduledoc "Schema representing a QueryTeamUsageStatsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :teams]
  defstruct [:duration, :next, :teams]
  @nested_components teams: ExStreamClient.Model.TeamUsageStats
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          teams: [ExStreamClient.Model.TeamUsageStats.t()]
        }
end
