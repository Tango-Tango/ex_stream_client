defmodule ExStreamClient.Model.VideoContentParameters do
  @moduledoc "Schema representing a VideoContentParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:harm_labels, :label_operator]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{harm_labels: [String.t()] | nil, label_operator: String.t() | nil}
end
