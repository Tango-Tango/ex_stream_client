defmodule ExStreamClient.Model.IngressAudioEncodingResponse do
  @moduledoc "Schema representing a IngressAudioEncodingResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:bitrate, :channels, :enable_dtx]
  defstruct [:bitrate, :channels, :enable_dtx]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{bitrate: integer(), channels: integer(), enable_dtx: boolean()}
end
