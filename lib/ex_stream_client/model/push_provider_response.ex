defmodule ExStreamClient.Model.PushProviderResponse do
  @moduledoc "Schema representing a PushProviderResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :name, :type, :updated_at]
  defstruct [
    :apn_auth_key,
    :apn_auth_type,
    :apn_development,
    :apn_host,
    :apn_key_id,
    :apn_p12_cert,
    :apn_sandbox_certificate,
    :apn_supports_remote_notifications,
    :apn_supports_voip_notifications,
    :apn_team_id,
    :apn_topic,
    :created_at,
    :description,
    :disabled_at,
    :disabled_reason,
    :firebase_apn_template,
    :firebase_credentials,
    :firebase_data_template,
    :firebase_host,
    :firebase_notification_template,
    :firebase_server_key,
    :huawei_app_id,
    :huawei_app_secret,
    :name,
    :type,
    :updated_at,
    :xiaomi_app_secret,
    :xiaomi_package_name
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          apn_auth_key: String.t() | nil,
          apn_auth_type: String.t() | nil,
          apn_development: boolean() | nil,
          apn_host: String.t() | nil,
          apn_key_id: String.t() | nil,
          apn_p12_cert: String.t() | nil,
          apn_sandbox_certificate: boolean() | nil,
          apn_supports_remote_notifications: boolean() | nil,
          apn_supports_voip_notifications: boolean() | nil,
          apn_team_id: String.t() | nil,
          apn_topic: String.t() | nil,
          created_at: float(),
          description: String.t() | nil,
          disabled_at: float() | nil,
          disabled_reason: String.t() | nil,
          firebase_apn_template: String.t() | nil,
          firebase_credentials: String.t() | nil,
          firebase_data_template: String.t() | nil,
          firebase_host: String.t() | nil,
          firebase_notification_template: String.t() | nil,
          firebase_server_key: String.t() | nil,
          huawei_app_id: String.t() | nil,
          huawei_app_secret: String.t() | nil,
          name: String.t(),
          type: String.t(),
          updated_at: float(),
          xiaomi_app_secret: String.t() | nil,
          xiaomi_package_name: String.t() | nil
        }
end
