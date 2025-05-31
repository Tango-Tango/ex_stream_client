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

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          device_errors: map() | nil,
          duration: String.t(),
          general_errors: [String.t()] | nil,
          rendered_apn_template: String.t() | nil,
          rendered_firebase_template: String.t() | nil,
          rendered_message: map() | nil,
          skip_devices: boolean() | nil
        }
end
