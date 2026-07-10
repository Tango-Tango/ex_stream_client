defmodule ExStreamClient.Model.IndividualRecordSettings do
  @moduledoc "Schema representing a IndividualRecordSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:mode]
  defstruct [:mode, :output_types]
  @nested_components mode: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          mode: :"auto-on" | :disabled | :available,
          output_types: [String.t()] | nil
        }
end
