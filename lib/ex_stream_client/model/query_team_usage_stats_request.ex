defmodule ExStreamClient.Model.QueryTeamUsageStatsRequest do
  @moduledoc "Schema representing a QueryTeamUsageStatsRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:end_date, :limit, :month, :next, :start_date]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          end_date: String.t() | nil,
          limit: integer() | nil,
          month: String.t() | nil,
          next: String.t() | nil,
          start_date: String.t() | nil
        }
end
