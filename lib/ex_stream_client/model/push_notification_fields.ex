defmodule ExStreamClient.Model.PushNotificationFields do
  @moduledoc "Schema representing a PushNotificationFields"
  use ExStreamClient.Jason
  @enforce_keys [:apn, :firebase, :huawei, :offline_only, :version, :xiaomi]
  defstruct [:version, :providers, :firebase, :apn, :huawei, :xiaomi, :offline_only]

  @type t :: %__MODULE__{
          version: String.t(),
          providers: [ExStreamClient.Model.PushProvider.t()] | nil,
          firebase: ExStreamClient.Model.FirebaseConfigFields.t(),
          apn: ExStreamClient.Model.APNConfigFields.t(),
          huawei: ExStreamClient.Model.HuaweiConfigFields.t(),
          xiaomi: ExStreamClient.Model.XiaomiConfigFields.t(),
          offline_only: boolean()
        }
end