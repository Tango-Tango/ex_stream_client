defmodule ExStreamClient.Model.APNConfig do
  @moduledoc "Schema representing a APNConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :auth_key,
    :auth_type,
    :bundle_id,
    :development,
    :disabled,
    :host,
    :key_id,
    :notification_template,
    :p12_cert,
    :team_id
  ]

  @nested_components auth_type: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          auth_key: String.t() | nil,
          auth_type: (:token | :certificate) | nil,
          bundle_id: String.t() | nil,
          development: boolean() | nil,
          disabled: boolean() | nil,
          host: String.t() | nil,
          key_id: String.t() | nil,
          notification_template: String.t() | nil,
          p12_cert: String.t() | nil,
          team_id: String.t() | nil
        }
end
