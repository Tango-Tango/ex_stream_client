defmodule ExStreamClient.Model.EventNotificationSettings do
  @moduledoc "Schema representing a EventNotificationSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:apns, :enabled, :fcm]
  defstruct [:apns, :enabled, :fcm]
  @nested_components apns: ExStreamClient.Model.APNS, fcm: ExStreamClient.Model.FCM
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          apns: ExStreamClient.Model.APNS.t(),
          enabled: boolean(),
          fcm: ExStreamClient.Model.FCM.t()
        }
end
