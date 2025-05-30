defmodule ExStreamClient.Model.RTMPIngress do
  @moduledoc "Schema representing a RTMPIngress"
  use ExStreamClient.Jason
  @enforce_keys [:address]
  defstruct [:address]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{address: String.t()}
end
