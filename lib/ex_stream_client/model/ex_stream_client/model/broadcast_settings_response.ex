defmodule ExStreamClient.Model.BroadcastSettingsResponse do
  @moduledoc "Schema representing a BroadcastSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:enabled, :hls, :rtmp]
  defstruct [:enabled, :hls, :rtmp]

  @type t :: %__MODULE__{
          enabled: boolean(),
          hls: ExStreamClient.Model.HLSSettingsResponse.t(),
          rtmp: ExStreamClient.Model.RTMPSettingsResponse.t()
        }
end