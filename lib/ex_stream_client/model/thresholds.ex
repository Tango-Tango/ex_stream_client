defmodule ExStreamClient.Model.Thresholds do
  @moduledoc "Schema representing a Thresholds"
  use ExStreamClient.Jason
  defstruct [:explicit, :spam, :toxic]

  @nested_components explicit: ExStreamClient.Model.LabelThresholds,
                     spam: ExStreamClient.Model.LabelThresholds,
                     toxic: ExStreamClient.Model.LabelThresholds
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          explicit: ExStreamClient.Model.LabelThresholds.t() | nil,
          spam: ExStreamClient.Model.LabelThresholds.t() | nil,
          toxic: ExStreamClient.Model.LabelThresholds.t() | nil
        }
end
