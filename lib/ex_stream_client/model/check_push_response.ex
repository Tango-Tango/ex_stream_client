defmodule ExStreamClient.Model.CheckPushResponse do
  @moduledoc "Schema representing a CheckPushResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [
    :duration,
    :device_errors,
    :general_errors,
    :rendered_apn_template,
    :rendered_firebase_template,
    :rendered_message,
    :skip_devices
  ]

  @type t :: %__MODULE__{
          duration: String.t(),
          device_errors: map() | nil,
          general_errors: [String.t()] | nil,
          rendered_apn_template: String.t() | nil,
          rendered_firebase_template: String.t() | nil,
          rendered_message: map() | nil,
          skip_devices: boolean() | nil
        }
end