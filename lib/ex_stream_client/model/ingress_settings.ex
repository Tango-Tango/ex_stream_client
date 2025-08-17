defmodule ExStreamClient.Model.IngressSettings do
  @moduledoc "Schema representing a IngressSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled]
  defstruct [:audio_encoding_options, :enabled, :video_encoding_options]

  @nested_components audio_encoding_options: ExStreamClient.Model.IngressAudioEncodingOptions,
                     video_encoding_options:
                       {:map, ExStreamClient.Model.IngressVideoEncodingOptions}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          audio_encoding_options: ExStreamClient.Model.IngressAudioEncodingOptions.t() | nil,
          enabled: boolean(),
          video_encoding_options:
            %{optional(String.t()) => ExStreamClient.Model.IngressVideoEncodingOptions.t()} | nil
        }
end
