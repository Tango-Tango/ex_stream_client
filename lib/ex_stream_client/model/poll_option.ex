defmodule ExStreamClient.Model.PollOption do
  @moduledoc "Schema representing a PollOption"
  use ExStreamClient.Jason
  @enforce_keys [:custom, :id, :text]
  defstruct [:custom, :id, :text]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{custom: map(), id: String.t(), text: String.t()}
end
