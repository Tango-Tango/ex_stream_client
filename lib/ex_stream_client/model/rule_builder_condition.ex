defmodule ExStreamClient.Model.RuleBuilderCondition do
  @moduledoc "Schema representing a RuleBuilderCondition"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:labels, :provider, :threshold, :time_window]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          labels: [String.t()] | nil,
          provider: String.t() | nil,
          threshold: integer() | nil,
          time_window: String.t() | nil
        }
end
