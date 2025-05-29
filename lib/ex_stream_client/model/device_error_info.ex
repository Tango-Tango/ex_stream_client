defmodule ExStreamClient.Model.DeviceErrorInfo do
  @moduledoc "Schema representing a DeviceErrorInfo"
  use ExStreamClient.Jason
  @enforce_keys [:error_message, :provider, :provider_name]
  defstruct [:provider, :error_message, :provider_name]

  @type t :: %__MODULE__{
          provider: String.t(),
          error_message: String.t(),
          provider_name: String.t()
        }
end