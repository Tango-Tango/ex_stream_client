defmodule ExStreamClient.Model.NotificationSettings do
  @moduledoc "Schema representing a NotificationSettings"
  use ExStreamClient.Jason

  @enforce_keys [
    :call_live_started,
    :call_missed,
    :call_notification,
    :call_ring,
    :enabled,
    :session_started
  ]
  defstruct [
    :enabled,
    :call_live_started,
    :call_missed,
    :call_notification,
    :call_ring,
    :session_started
  ]

  @type t :: %__MODULE__{
          enabled: boolean(),
          call_live_started: ExStreamClient.Model.EventNotificationSettings.t(),
          call_missed: ExStreamClient.Model.EventNotificationSettings.t(),
          call_notification: ExStreamClient.Model.EventNotificationSettings.t(),
          call_ring: ExStreamClient.Model.EventNotificationSettings.t(),
          session_started: ExStreamClient.Model.EventNotificationSettings.t()
        }
end