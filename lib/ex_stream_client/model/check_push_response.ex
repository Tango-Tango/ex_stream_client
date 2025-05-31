defmodule ExStreamClient.Model.CheckPushResponse do
  @moduledoc "Schema representing a CheckPushResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [
    :device_errors,
    :duration,
    :general_errors,
    :rendered_apn_template,
    :rendered_firebase_template,
    :rendered_message,
    :skip_devices
  ]

  @nested_components device_errors: {:map, ExStreamClient.Model.DeviceErrorInfo}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          device_errors:
            %{optional(String.t()) => ExStreamClient.Model.DeviceErrorInfo.t()} | nil,
          duration: String.t(),
          general_errors: [String.t()] | nil,
          rendered_apn_template: String.t() | nil,
          rendered_firebase_template: String.t() | nil,
          rendered_message: %{optional(String.t()) => String.t()} | nil,
          skip_devices: boolean() | nil
        }
end
