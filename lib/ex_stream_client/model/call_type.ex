defmodule ExStreamClient.Model.CallType do
  @moduledoc "Schema representing a CallType"
  use ExStreamClient.Jason

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
    :name,
    :created_at,
    :updated_at,
    :external_storage,
    :app_pk,
    :settings,
    :enable_live_insights,
    :pk,
    :notification_settings
  ]

  @type t :: %__MODULE__{
          name: String.t(),
          created_at: float(),
          updated_at: float(),
          external_storage: String.t(),
          app_pk: integer(),
          settings: ExStreamClient.Model.CallSettings.t() | nil,
          enable_live_insights: boolean(),
          pk: integer(),
          notification_settings: ExStreamClient.Model.NotificationSettings.t() | nil
        }
end