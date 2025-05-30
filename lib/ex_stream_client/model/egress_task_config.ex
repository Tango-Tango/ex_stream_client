defmodule ExStreamClient.Model.EgressTaskConfig do
  @moduledoc "Schema representing a EgressTaskConfig"
  use ExStreamClient.Jason

  defstruct [
    :egress_user,
    :frame_recording_egress_config,
    :hls_egress_config,
    :recording_egress_config,
    :rtmp_egress_config,
    :stt_egress_config
  ]

  @nested_components %{
    egress_user: ExStreamClient.Model.EgressUser,
    frame_recording_egress_config: ExStreamClient.Model.FrameRecordingEgressConfig,
    hls_egress_config: ExStreamClient.Model.HLSEgressConfig,
    recording_egress_config: ExStreamClient.Model.RecordingEgressConfig,
    rtmp_egress_config: ExStreamClient.Model.RTMPEgressConfig,
    stt_egress_config: ExStreamClient.Model.STTEgressConfig
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          egress_user: ExStreamClient.Model.EgressUser.t() | nil,
          frame_recording_egress_config:
            ExStreamClient.Model.FrameRecordingEgressConfig.t() | nil,
          hls_egress_config: ExStreamClient.Model.HLSEgressConfig.t() | nil,
          recording_egress_config: ExStreamClient.Model.RecordingEgressConfig.t() | nil,
          rtmp_egress_config: ExStreamClient.Model.RTMPEgressConfig.t() | nil,
          stt_egress_config: ExStreamClient.Model.STTEgressConfig.t() | nil
        }
end
