defmodule ExStreamClient.Model.RetentionRunResponse do
  @moduledoc "Schema representing a RetentionRunResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:app_pk, :date, :policy, :stats]
  defstruct [:app_pk, :date, :policy, :stats]
  @nested_components stats: ExStreamClient.Model.RunStats
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app_pk: integer(),
          date: String.t(),
          policy: String.t(),
          stats: ExStreamClient.Model.RunStats.t()
        }
end
