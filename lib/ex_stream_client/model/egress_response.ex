defmodule ExStreamClient.Model.EgressResponse do
  @moduledoc "Schema representing a EgressResponse"
  use ExStreamClient.Jason
  @enforce_keys [:broadcasting, :rtmps]
  defstruct [:broadcasting, :rtmps, :frame_recording, :hls]

  @type t :: %__MODULE__{
          broadcasting: boolean(),
          rtmps: [ExStreamClient.Model.EgressRTMPResponse.t()],
          frame_recording: ExStreamClient.Model.FrameRecordingResponse.t() | nil,
          hls: ExStreamClient.Model.EgressHLSResponse.t() | nil
        }
end