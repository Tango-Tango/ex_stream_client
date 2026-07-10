defmodule ExStreamClient.Model.SpeechSegmentConfig do
  @moduledoc "Schema representing a SpeechSegmentConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:max_speech_caption_ms, :silence_duration_ms]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          max_speech_caption_ms: integer() | nil,
          silence_duration_ms: integer() | nil
        }
end
