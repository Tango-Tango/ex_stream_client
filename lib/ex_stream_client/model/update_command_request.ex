defmodule ExStreamClient.Model.UpdateCommandRequest do
  @moduledoc "Schema representing a UpdateCommandRequest"
  use ExStreamClient.Jason
  @enforce_keys [:description]
  defstruct [:args, :description, :set]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{args: String.t() | nil, description: String.t(), set: String.t() | nil}
end
