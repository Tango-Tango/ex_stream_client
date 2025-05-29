defmodule ExStreamClient.Model.EventNotificationSettings do
  @moduledoc "Schema representing a EventNotificationSettings"
  use ExStreamClient.Jason
  @enforce_keys [:apns, :enabled, :fcm]
  defstruct [:apns, :enabled, :fcm]

  @type t :: %__MODULE__{
          apns: ExStreamClient.Model.APNS.t(),
          enabled: boolean(),
          fcm: ExStreamClient.Model.FCM.t()
        }
end