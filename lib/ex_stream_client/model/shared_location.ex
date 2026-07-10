defmodule ExStreamClient.Model.SharedLocation do
  @moduledoc "Schema representing a SharedLocation"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:latitude, :longitude]
  defstruct [:created_by_device_id, :end_at, :latitude, :longitude]
  @nested_components end_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_by_device_id: String.t() | nil,
          end_at: (DateTime.t() | integer() | String.t()) | nil,
          latitude: float(),
          longitude: float()
        }
end
