defmodule ExStreamClient.Model.CallSettings do
  @moduledoc "Schema representing a CallSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :audio,
    :backstage,
    :broadcasting,
    :frame_recording,
    :geofencing,
    :ingress,
    :limits,
    :recording,
    :ring,
    :screensharing,
    :session,
    :thumbnails,
    :transcription,
    :video
  ]

  @nested_components audio: ExStreamClient.Model.AudioSettings,
                     backstage: ExStreamClient.Model.BackstageSettings,
                     broadcasting: ExStreamClient.Model.BroadcastSettings,
                     frame_recording: ExStreamClient.Model.FrameRecordSettings,
                     geofencing: ExStreamClient.Model.GeofenceSettings,
                     ingress: ExStreamClient.Model.IngressSettings,
                     limits: ExStreamClient.Model.LimitsSettings,
                     recording: ExStreamClient.Model.RecordSettings,
                     ring: ExStreamClient.Model.RingSettings,
                     screensharing: ExStreamClient.Model.ScreensharingSettings,
                     session: ExStreamClient.Model.SessionSettings,
                     thumbnails: ExStreamClient.Model.ThumbnailsSettings,
                     transcription: ExStreamClient.Model.TranscriptionSettings,
                     video: ExStreamClient.Model.VideoSettings
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          audio: ExStreamClient.Model.AudioSettings.t() | nil,
          backstage: ExStreamClient.Model.BackstageSettings.t() | nil,
          broadcasting: ExStreamClient.Model.BroadcastSettings.t() | nil,
          frame_recording: ExStreamClient.Model.FrameRecordSettings.t() | nil,
          geofencing: ExStreamClient.Model.GeofenceSettings.t() | nil,
          ingress: ExStreamClient.Model.IngressSettings.t() | nil,
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
