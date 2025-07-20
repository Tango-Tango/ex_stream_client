defmodule ExStreamClient.Model.UpdateLiveLocationRequest do
  @moduledoc "Schema representing a UpdateLiveLocationRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_by_device_id, :message_id]
  defstruct [:created_by_device_id, :end_at, :latitude, :longitude, :message_id]
  @nested_components end_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_by_device_id: String.t(),
          end_at: (DateTime.t() | integer() | String.t()) | nil,
          latitude: float() | nil,
          longitude: float() | nil,
          message_id: String.t()
        }
end
