defmodule ExStreamClient.Model.CallType do
  @moduledoc "Schema representing a CallType"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :app_pk,
    :created_at,
    :enable_live_insights,
    :external_storage,
    :name,
    :pk,
    :updated_at
  ]
  defstruct [
    :app_pk,
    :created_at,
    :enable_live_insights,
    :external_storage,
    :name,
    :notification_settings,
    :pk,
    :settings,
    :updated_at
  ]

  @nested_components notification_settings: ExStreamClient.Model.NotificationSettings,
                     settings: ExStreamClient.Model.CallSettings
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app_pk: integer(),
          created_at: float(),
          enable_live_insights: boolean(),
          external_storage: String.t(),
          name: String.t(),
          notification_settings: ExStreamClient.Model.NotificationSettings.t() | nil,
          pk: integer(),
          settings: ExStreamClient.Model.CallSettings.t() | nil,
          updated_at: float()
        }
end
