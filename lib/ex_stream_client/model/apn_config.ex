defmodule ExStreamClient.Model.APNConfig do
  @moduledoc "Schema representing a APNConfig"
  use ExStreamClient.Jason

  defstruct [
    :disabled,
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
          disabled: boolean() | nil,
          auth_key: String.t() | nil,
          host: String.t() | nil,
          key_id: String.t() | nil,
          notification_template: String.t() | nil,
          development: boolean() | nil,
          auth_type: (:token | :certificate) | nil,
          bundle_id: String.t() | nil,
          p12_cert: String.t() | nil,
          team_id: String.t() | nil
        }
end