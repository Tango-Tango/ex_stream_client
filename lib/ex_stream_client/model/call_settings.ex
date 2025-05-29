defmodule ExStreamClient.Model.CallSettings do
  @moduledoc "Schema representing a CallSettings"
  use ExStreamClient.Jason

  defstruct [
    :session,
    :broadcasting,
    :frame_recording,
    :audio,
    :backstage,
    :geofencing,
    :limits,
    :recording,
    :ring,
    :screensharing,
    :thumbnails,
    :transcription,
    :video
  ]

  @type t :: %__MODULE__{
          session: ExStreamClient.Model.SessionSettings.t() | nil,
          broadcasting: ExStreamClient.Model.BroadcastSettings.t() | nil,
          frame_recording: ExStreamClient.Model.FrameRecordSettings.t() | nil,
          audio: ExStreamClient.Model.AudioSettings.t() | nil,
          backstage: ExStreamClient.Model.BackstageSettings.t() | nil,
          geofencing: ExStreamClient.Model.GeofenceSettings.t() | nil,
          limits: ExStreamClient.Model.LimitsSettings.t() | nil,
          recording: ExStreamClient.Model.RecordSettings.t() | nil,
          ring: ExStreamClient.Model.RingSettings.t() | nil,
          screensharing: ExStreamClient.Model.ScreensharingSettings.t() | nil,
          thumbnails: ExStreamClient.Model.ThumbnailsSettings.t() | nil,
          transcription: ExStreamClient.Model.TranscriptionSettings.t() | nil,
          video: ExStreamClient.Model.VideoSettings.t() | nil
        }
end