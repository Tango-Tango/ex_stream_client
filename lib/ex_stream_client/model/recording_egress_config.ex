defmodule ExStreamClient.Model.RecordingEgressConfig do
  @moduledoc "Schema representing a RecordingEgressConfig"
  use ExStreamClient.Jason

  defstruct [
    :quality,
    :audio_only,
    :external_storage,
    :storage_name,
    :composite_app_settings,
    :video_orientation_hint
  ]

  @type t :: %__MODULE__{
          quality: ExStreamClient.Model.Quality.t() | nil,
          audio_only: boolean() | nil,
          external_storage: ExStreamClient.Model.ExternalStorage.t() | nil,
          storage_name: String.t() | nil,
          composite_app_settings: ExStreamClient.Model.CompositeAppSettings.t() | nil,
          video_orientation_hint: ExStreamClient.Model.VideoOrientation.t() | nil
        }
end