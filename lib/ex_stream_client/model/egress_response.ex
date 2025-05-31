defmodule ExStreamClient.Model.EgressResponse do
  @moduledoc "Schema representing a EgressResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:broadcasting, :rtmps]
  defstruct [:broadcasting, :frame_recording, :hls, :rtmps]

  @nested_components frame_recording: ExStreamClient.Model.FrameRecordingResponse,
                     hls: ExStreamClient.Model.EgressHLSResponse,
                     rtmps: ExStreamClient.Model.EgressRTMPResponse
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
