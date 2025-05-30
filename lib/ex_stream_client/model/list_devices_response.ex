defmodule ExStreamClient.Model.ListDevicesResponse do
  @moduledoc "Schema representing a ListDevicesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:devices, :duration]
  defstruct [:devices, :duration]
  @nested_components %{devices: ExStreamClient.Model.DeviceResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{devices: [ExStreamClient.Model.DeviceResponse.t()], duration: String.t()}
end
