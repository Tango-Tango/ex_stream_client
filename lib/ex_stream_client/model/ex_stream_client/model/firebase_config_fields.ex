defmodule ExStreamClient.Model.FirebaseConfigFields do
  @moduledoc "Schema representing a FirebaseConfigFields"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [
    :enabled,
    :apn_template,
    :credentials_json,
    :data_template,
    :notification_template,
    :server_key
  ]

  @type t :: %__MODULE__{
          enabled: boolean(),
          apn_template: String.t() | nil,
          credentials_json: String.t() | nil,
          data_template: String.t() | nil,
          notification_template: String.t() | nil,
          server_key: String.t() | nil
        }
end