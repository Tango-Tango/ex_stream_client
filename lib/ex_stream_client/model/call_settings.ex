defmodule ExStreamClient.Model.CallSettings do
  @moduledoc "Schema representing a CallSettings"
  use ExStreamClient.Jason

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

  @nested_components %{
    session: ExStreamClient.Model.SessionSettings,
    backstage: ExStreamClient.Model.BackstageSettings,
    recording: ExStreamClient.Model.RecordSettings,
    thumbnails: ExStreamClient.Model.ThumbnailsSettings,
    audio: ExStreamClient.Model.AudioSettings,
    broadcasting: ExStreamClient.Model.BroadcastSettings,
    frame_recording: ExStreamClient.Model.FrameRecordSettings,
    geofencing: ExStreamClient.Model.GeofenceSettings,
    limits: ExStreamClient.Model.LimitsSettings,
    ring: ExStreamClient.Model.RingSettings,
    screensharing: ExStreamClient.Model.ScreensharingSettings,
    transcription: ExStreamClient.Model.TranscriptionSettings,
    video: ExStreamClient.Model.VideoSettings
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          audio: ExStreamClient.Model.AudioSettings.t() | nil,
          backstage: ExStreamClient.Model.BackstageSettings.t() | nil,
          broadcasting: ExStreamClient.Model.BroadcastSettings.t() | nil,
          frame_recording: ExStreamClient.Model.FrameRecordSettings.t() | nil,
          geofencing: ExStreamClient.Model.GeofenceSettings.t() | nil,
          limits: ExStreamClient.Model.LimitsSettings.t() | nil,
          recording: ExStreamClient.Model.RecordSettings.t() | nil,
          ring: ExStreamClient.Model.RingSettings.t() | nil,
          screensharing: ExStreamClient.Model.ScreensharingSettings.t() | nil,
          session: ExStreamClient.Model.SessionSettings.t() | nil,
          thumbnails: ExStreamClient.Model.ThumbnailsSettings.t() | nil,
          transcription: ExStreamClient.Model.TranscriptionSettings.t() | nil,
          video: ExStreamClient.Model.VideoSettings.t() | nil
        }
end
