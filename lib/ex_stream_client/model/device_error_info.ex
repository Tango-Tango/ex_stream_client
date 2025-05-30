defmodule ExStreamClient.Model.DeviceErrorInfo do
  @moduledoc "Schema representing a DeviceErrorInfo"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:error_message, :provider, :provider_name]
  defstruct [:error_message, :provider, :provider_name]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          error_message: String.t(),
          provider: String.t(),
          provider_name: String.t()
        }
end
