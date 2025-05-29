defmodule ExStreamClient.Model.DeviceErrorInfo do
  @moduledoc "Schema representing a DeviceErrorInfo"
  use ExStreamClient.Jason
  @enforce_keys [:error_message, :provider, :provider_name]
  defstruct [:error_message, :provider, :provider_name]

  @type t :: %__MODULE__{
          error_message: String.t(),
          provider: String.t(),
          provider_name: String.t()
        }
end