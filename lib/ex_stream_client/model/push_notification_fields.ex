defmodule ExStreamClient.Model.PushNotificationFields do
  @moduledoc "Schema representing a PushNotificationFields"
  use ExStreamClient.Jason
  @enforce_keys [:apn, :firebase, :huawei, :offline_only, :version, :xiaomi]
  defstruct [:apn, :firebase, :huawei, :offline_only, :providers, :version, :xiaomi]

  @nested_components %{
    providers: ExStreamClient.Model.PushProvider,
    xiaomi: ExStreamClient.Model.XiaomiConfigFields,
    huawei: ExStreamClient.Model.HuaweiConfigFields,
    apn: ExStreamClient.Model.APNConfigFields,
    firebase: ExStreamClient.Model.FirebaseConfigFields
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          apn: ExStreamClient.Model.APNConfigFields.t(),
          firebase: ExStreamClient.Model.FirebaseConfigFields.t(),
          huawei: ExStreamClient.Model.HuaweiConfigFields.t(),
          offline_only: boolean(),
          providers: [ExStreamClient.Model.PushProvider.t()] | nil,
          version: String.t(),
          xiaomi: ExStreamClient.Model.XiaomiConfigFields.t()
        }
end
