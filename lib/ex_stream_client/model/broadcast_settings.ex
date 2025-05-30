defmodule ExStreamClient.Model.BroadcastSettings do
  @moduledoc "Schema representing a BroadcastSettings"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled, :hls, :rtmp]

  @nested_components %{
    hls: ExStreamClient.Model.HLSSettings,
    rtmp: ExStreamClient.Model.RTMPSettings
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          enabled: boolean(),
          hls: ExStreamClient.Model.HLSSettings.t() | nil,
          rtmp: ExStreamClient.Model.RTMPSettings.t() | nil
        }
end
