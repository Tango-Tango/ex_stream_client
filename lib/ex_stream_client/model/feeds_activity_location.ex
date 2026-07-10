defmodule ExStreamClient.Model.FeedsActivityLocation do
  @moduledoc "Schema representing a FeedsActivityLocation"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:lat, :lng]
  defstruct [:lat, :lng]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{lat: float(), lng: float()}
end
