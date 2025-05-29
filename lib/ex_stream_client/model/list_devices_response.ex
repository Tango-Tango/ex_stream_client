defmodule ExStreamClient.Model.ListDevicesResponse do
  @moduledoc "Schema representing a ListDevicesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:devices, :duration]
  defstruct [:duration, :devices]
  @type t :: %__MODULE__{duration: String.t(), devices: [ExStreamClient.Model.DeviceResponse.t()]}
end