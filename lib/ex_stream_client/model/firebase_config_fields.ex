defmodule ExStreamClient.Model.FirebaseConfigFields do
  @moduledoc "Schema representing a FirebaseConfigFields"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled]
  defstruct [
    :apn_template,
    :credentials_json,
    :data_template,
    :enabled,
    :notification_template,
    :server_key
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          apn_template: String.t() | nil,
          credentials_json: String.t() | nil,
          data_template: String.t() | nil,
          enabled: boolean(),
          notification_template: String.t() | nil,
          server_key: String.t() | nil
        }
end
