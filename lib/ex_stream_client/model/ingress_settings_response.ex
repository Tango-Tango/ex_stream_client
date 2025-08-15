defmodule ExStreamClient.Model.IngressSettingsResponse do
  @moduledoc "Schema representing a IngressSettingsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled]
  defstruct [:audio_encoding_options, :enabled, :video_encoding_options]

  @nested_components audio_encoding_options: ExStreamClient.Model.IngressAudioEncodingResponse,
                     video_encoding_options:
                       {:map, ExStreamClient.Model.IngressVideoEncodingResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          audio_encoding_options: ExStreamClient.Model.IngressAudioEncodingResponse.t() | nil,
          enabled: boolean(),
          video_encoding_options:
            %{optional(String.t()) => ExStreamClient.Model.IngressVideoEncodingResponse.t()} | nil
        }
end
