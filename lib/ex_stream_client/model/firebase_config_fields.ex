defmodule ExStreamClient.Model.FirebaseConfigFields do
  @moduledoc "Schema representing a FirebaseConfigFields"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [
    :apn_template,
    :credentials_json,
    :data_template,
    :enabled,
    :notification_template,
    :server_key
  ]

  @type t :: %__MODULE__{
          apn_template: String.t() | nil,
          credentials_json: String.t() | nil,
          data_template: String.t() | nil,
          enabled: boolean(),
          notification_template: String.t() | nil,
          server_key: String.t() | nil
        }
end