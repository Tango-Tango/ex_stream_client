defmodule ExStreamClient.Model.FlagResponse do
  @moduledoc "Schema representing a FlagResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :item_id]
  defstruct [:duration, :item_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), item_id: String.t()}
end
