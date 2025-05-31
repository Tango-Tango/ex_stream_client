defmodule ExStreamClient.Model.APNConfigFields do
  @moduledoc "Schema representing a APNConfigFields"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:development, :enabled]
  defstruct [
    :auth_key,
    :auth_type,
    :bundle_id,
    :development,
    :enabled,
    :host,
    :key_id,
    :notification_template,
    :p12_cert,
    :team_id
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          auth_key: String.t() | nil,
          auth_type: String.t() | nil,
          bundle_id: String.t() | nil,
          development: boolean(),
          enabled: boolean(),
          host: String.t() | nil,
          key_id: String.t() | nil,
          notification_template: String.t() | nil,
          p12_cert: String.t() | nil,
          team_id: String.t() | nil
        }
end
