defmodule ExStreamClient.Model.FirebaseConfig do
  @moduledoc "Schema representing a FirebaseConfig"
  use ExStreamClient.Jason

  defstruct [
    :disabled,
    :apn_template,
    :credentials_json,
    :data_template,
    :notification_template,
    :server_key
  ]

  @type t :: %__MODULE__{
          disabled: boolean() | nil,
          apn_template: String.t() | nil,
          credentials_json: String.t() | nil,
          data_template: String.t() | nil,
          notification_template: String.t() | nil,
          server_key: String.t() | nil
        }
end