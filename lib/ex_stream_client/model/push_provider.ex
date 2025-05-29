defmodule ExStreamClient.Model.PushProvider do
  @moduledoc "Schema representing a PushProvider"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :name, :type, :updated_at]
  defstruct [
    :name,
    :type,
    :description,
    :created_at,
    :updated_at,
    :disabled_reason,
    :firebase_data_template,
    :apn_auth_key,
    :apn_auth_type,
    :apn_development,
    :apn_host,
    :apn_key_id,
    :apn_p12_cert,
    :apn_team_id,
    :apn_topic,
    :disabled_at,
    :firebase_apn_template,
    :firebase_credentials,
    :firebase_host,
    :firebase_notification_template,
    :firebase_server_key,
    :huawei_app_id,
    :huawei_app_secret,
    :xiaomi_app_secret,
    :xiaomi_package_name,
    :apn_notification_template,
    :push_templates
  ]

  @type t :: %__MODULE__{
          name: String.t(),
          type: String.t(),
          description: String.t() | nil,
          created_at: float(),
          updated_at: float(),
          disabled_reason: String.t() | nil,
          firebase_data_template: String.t() | nil,
          apn_auth_key: String.t() | nil,
          apn_auth_type: String.t() | nil,
          apn_development: boolean() | nil,
          apn_host: String.t() | nil,
          apn_key_id: String.t() | nil,
          apn_p12_cert: String.t() | nil,
          apn_team_id: String.t() | nil,
          apn_topic: String.t() | nil,
          disabled_at: float() | nil,
          firebase_apn_template: String.t() | nil,
          firebase_credentials: String.t() | nil,
          firebase_host: String.t() | nil,
          firebase_notification_template: String.t() | nil,
          firebase_server_key: String.t() | nil,
          huawei_app_id: String.t() | nil,
          huawei_app_secret: String.t() | nil,
          xiaomi_app_secret: String.t() | nil,
          xiaomi_package_name: String.t() | nil,
          apn_notification_template: String.t() | nil,
          push_templates: [ExStreamClient.Model.PushTemplate.t()] | nil
        }
end