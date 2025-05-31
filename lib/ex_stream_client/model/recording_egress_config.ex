defmodule ExStreamClient.Model.RecordingEgressConfig do
  @moduledoc "Schema representing a RecordingEgressConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :audio_only,
    :composite_app_settings,
    :external_storage,
    :quality,
    :storage_name,
    :video_orientation_hint
  ]

  @nested_components composite_app_settings: ExStreamClient.Model.CompositeAppSettings,
                     external_storage: ExStreamClient.Model.ExternalStorage,
                     quality: ExStreamClient.Model.Quality,
                     video_orientation_hint: ExStreamClient.Model.VideoOrientation
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          audio_only: boolean() | nil,
          composite_app_settings: ExStreamClient.Model.CompositeAppSettings.t() | nil,
          external_storage: ExStreamClient.Model.ExternalStorage.t() | nil,
          quality: ExStreamClient.Model.Quality.t() | nil,
          storage_name: String.t() | nil,
          video_orientation_hint: ExStreamClient.Model.VideoOrientation.t() | nil
        }
end
