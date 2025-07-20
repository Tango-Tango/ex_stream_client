defmodule ExStreamClient.Model.SharedLocationsResponse do
  @moduledoc "Schema representing a SharedLocationsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:active_live_locations, :duration]
  defstruct [:active_live_locations, :duration]
  @nested_components active_live_locations: ExStreamClient.Model.SharedLocationResponseData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          active_live_locations: [ExStreamClient.Model.SharedLocationResponseData.t()],
          duration: String.t()
        }
end
