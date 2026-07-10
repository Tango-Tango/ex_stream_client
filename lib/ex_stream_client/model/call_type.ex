defmodule ExStreamClient.Model.CallType do
  @moduledoc "Schema representing a CallType"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:app, :created_at, :id, :name, :recording_external_storage, :updated_at]
  defstruct [
    :app,
    :created_at,
    :id,
    :name,
    :notification_settings,
    :recording_external_storage,
    :settings,
    :updated_at
  ]

  @nested_components created_at: :datetime,
                     notification_settings: ExStreamClient.Model.NotificationSettings,
                     settings: ExStreamClient.Model.CallSettings,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app: integer(),
          created_at: DateTime.t() | integer() | String.t(),
          id: integer(),
          name: String.t(),
          notification_settings: ExStreamClient.Model.NotificationSettings.t() | nil,
          recording_external_storage: String.t(),
          settings: ExStreamClient.Model.CallSettings.t() | nil,
          updated_at: DateTime.t() | integer() | String.t()
        }
end
