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
    :call_live_started,
    :call_missed,
    :call_notification,
    :call_ring,
    :enabled,
    :session_started
  ]

  @nested_components call_live_started: ExStreamClient.Model.EventNotificationSettings,
                     call_missed: ExStreamClient.Model.EventNotificationSettings,
                     call_notification: ExStreamClient.Model.EventNotificationSettings,
                     call_ring: ExStreamClient.Model.EventNotificationSettings,
                     session_started: ExStreamClient.Model.EventNotificationSettings
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          call_live_started: ExStreamClient.Model.EventNotificationSettings.t(),
          call_missed: ExStreamClient.Model.EventNotificationSettings.t(),
          call_notification: ExStreamClient.Model.EventNotificationSettings.t(),
          call_ring: ExStreamClient.Model.EventNotificationSettings.t(),
          enabled: boolean(),
          session_started: ExStreamClient.Model.EventNotificationSettings.t()
        }
end
