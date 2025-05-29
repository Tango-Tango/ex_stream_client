defmodule ExStreamClient.Model.ListDevicesResponse do
  @moduledoc "Schema representing a ListDevicesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:devices, :duration]
  defstruct [:devices, :duration]
  @type t :: %__MODULE__{devices: [ExStreamClient.Model.DeviceResponse.t()], duration: String.t()}
end