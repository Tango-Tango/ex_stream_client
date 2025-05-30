defmodule ExStreamClient.Model.LimitInfo do
  @moduledoc "Schema representing a LimitInfo"
  use ExStreamClient.Jason
  @enforce_keys [:limit, :remaining, :reset]
  defstruct [:limit, :remaining, :reset]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{limit: integer(), remaining: integer(), reset: integer()}
end
