defmodule ExStreamClient.Model.APNConfigFields do
  @moduledoc "Schema representing a APNConfigFields"
  use ExStreamClient.Jason
  @enforce_keys [:development, :enabled]
  defstruct [
    :enabled,
    :auth_key,
    :host,
    :key_id,
    :notification_template,
    :development,
    :auth_type,
    :bundle_id,
    :p12_cert,
    :team_id
  ]

  @type t :: %__MODULE__{
          enabled: boolean(),
          auth_key: String.t() | nil,
          host: String.t() | nil,
          key_id: String.t() | nil,
          notification_template: String.t() | nil,
          development: boolean(),
          auth_type: String.t() | nil,
          bundle_id: String.t() | nil,
          p12_cert: String.t() | nil,
          team_id: String.t() | nil
        }
end