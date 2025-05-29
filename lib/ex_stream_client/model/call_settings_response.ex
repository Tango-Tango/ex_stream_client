defmodule ExStreamClient.Model.CallSettingsResponse do
  @moduledoc "Schema representing a CallSettingsResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :audio,
    :backstage,
    :broadcasting,
    :frame_recording,
    :geofencing,
    :limits,
    :recording,
    :ring,
    :screensharing,
    :session,
    :thumbnails,
    :transcription,
    :video
  ]
  defstruct [
    :audio,
    :backstage,
    :broadcasting,
    :frame_recording,
    :geofencing,
    :limits,
    :recording,
    :ring,
    :screensharing,
    :session,
    :thumbnails,
    :transcription,
    :video
  ]

  @type t :: %__MODULE__{
          audio: ExStreamClient.Model.AudioSettingsResponse.t(),
          backstage: ExStreamClient.Model.BackstageSettingsResponse.t(),
          broadcasting: ExStreamClient.Model.BroadcastSettingsResponse.t(),
          frame_recording: ExStreamClient.Model.FrameRecordingSettingsResponse.t(),
          geofencing: ExStreamClient.Model.GeofenceSettingsResponse.t(),
          limits: ExStreamClient.Model.LimitsSettingsResponse.t(),
          recording: ExStreamClient.Model.RecordSettingsResponse.t(),
          ring: ExStreamClient.Model.RingSettingsResponse.t(),
          screensharing: ExStreamClient.Model.ScreensharingSettingsResponse.t(),
          session: ExStreamClient.Model.SessionSettingsResponse.t(),
          thumbnails: ExStreamClient.Model.ThumbnailsSettingsResponse.t(),
          transcription: ExStreamClient.Model.TranscriptionSettingsResponse.t(),
          video: ExStreamClient.Model.VideoSettingsResponse.t()
        }
end