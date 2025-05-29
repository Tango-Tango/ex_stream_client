defmodule ExStreamClient.Model.Thresholds do
  @moduledoc "Schema representing a Thresholds"
  use ExStreamClient.Jason
  defstruct [:explicit, :spam, :toxic]

  @type t :: %__MODULE__{
          explicit: ExStreamClient.Model.LabelThresholds.t() | nil,
          spam: ExStreamClient.Model.LabelThresholds.t() | nil,
          toxic: ExStreamClient.Model.LabelThresholds.t() | nil
        }
end