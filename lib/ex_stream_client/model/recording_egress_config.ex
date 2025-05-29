defmodule ExStreamClient.Model.RecordingEgressConfig do
  @moduledoc "Schema representing a RecordingEgressConfig"
  use ExStreamClient.Jason

  defstruct [
    :audio_only,
    :composite_app_settings,
    :external_storage,
    :quality,
    :storage_name,
    :video_orientation_hint
  ]

  @type t :: %__MODULE__{
          audio_only: boolean() | nil,
          composite_app_settings: ExStreamClient.Model.CompositeAppSettings.t() | nil,
          external_storage: ExStreamClient.Model.ExternalStorage.t() | nil,
          quality: ExStreamClient.Model.Quality.t() | nil,
          storage_name: String.t() | nil,
          video_orientation_hint: ExStreamClient.Model.VideoOrientation.t() | nil
        }
end