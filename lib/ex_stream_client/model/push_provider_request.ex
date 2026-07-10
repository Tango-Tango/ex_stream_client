defmodule ExStreamClient.Model.PushProviderRequest do
  @moduledoc "Schema representing a PushProviderRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:name]
  defstruct [
    :apn_auth_key,
    :apn_auth_type,
    :apn_development,
    :apn_host,
    :apn_key_id,
    :apn_notification_template,
    :apn_p12_cert,
    :apn_team_id,
    :apn_topic,
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
    :xiaomi_app_secret,
    :xiaomi_package_name
  ]

  @nested_components disabled_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          apn_auth_key: String.t() | nil,
          apn_auth_type: String.t() | nil,
          apn_development: boolean() | nil,
          apn_host: String.t() | nil,
          apn_key_id: String.t() | nil,
          apn_notification_template: String.t() | nil,
          apn_p12_cert: String.t() | nil,
          apn_team_id: String.t() | nil,
          apn_topic: String.t() | nil,
          description: String.t() | nil,
          disabled_at: (DateTime.t() | integer() | String.t()) | nil,
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
          type: String.t() | nil,
          xiaomi_app_secret: String.t() | nil,
          xiaomi_package_name: String.t() | nil
        }
end
