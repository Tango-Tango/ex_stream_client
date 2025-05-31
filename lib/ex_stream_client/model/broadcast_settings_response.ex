defmodule ExStreamClient.Model.BroadcastSettingsResponse do
  @moduledoc "Schema representing a BroadcastSettingsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled, :hls, :rtmp]
  defstruct [:enabled, :hls, :rtmp]

  @nested_components hls: ExStreamClient.Model.HLSSettingsResponse,
                     rtmp: ExStreamClient.Model.RTMPSettingsResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          enabled: boolean(),
          hls: ExStreamClient.Model.HLSSettingsResponse.t(),
          rtmp: ExStreamClient.Model.RTMPSettingsResponse.t()
        }
end
