defmodule ExStreamClient.Model.ImageContentParameters do
  @moduledoc "Schema representing a ImageContentParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:harm_labels]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{harm_labels: [String.t()] | nil}
end
