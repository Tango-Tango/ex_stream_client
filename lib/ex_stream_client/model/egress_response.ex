defmodule ExStreamClient.Model.EgressResponse do
  @moduledoc "Schema representing a EgressResponse"
  use ExStreamClient.Jason
  @enforce_keys [:broadcasting, :rtmps]
  defstruct [:broadcasting, :frame_recording, :hls, :rtmps]

  @nested_components %{
    hls: ExStreamClient.Model.EgressHLSResponse,
    frame_recording: ExStreamClient.Model.FrameRecordingResponse,
    rtmps: ExStreamClient.Model.EgressRTMPResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          broadcasting: boolean(),
          frame_recording: ExStreamClient.Model.FrameRecordingResponse.t() | nil,
          hls: ExStreamClient.Model.EgressHLSResponse.t() | nil,
          rtmps: [ExStreamClient.Model.EgressRTMPResponse.t()]
        }
end
