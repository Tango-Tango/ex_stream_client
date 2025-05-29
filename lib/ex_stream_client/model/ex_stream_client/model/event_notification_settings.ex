defmodule ExStreamClient.Model.EventNotificationSettings do
  @moduledoc "Schema representing a EventNotificationSettings"
  use ExStreamClient.Jason
  @enforce_keys [:apns, :enabled, :fcm]
  defstruct [:enabled, :apns, :fcm]

  @type t :: %__MODULE__{
          enabled: boolean(),
          apns: ExStreamClient.Model.APNS.t(),
          fcm: ExStreamClient.Model.FCM.t()
        }
end