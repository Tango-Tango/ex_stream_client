defmodule ExStreamClient.Model.CallActionOptions do
  @moduledoc "Schema representing a CallActionOptions"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :duration,
    :flag_reason,
    :kick_reason,
    :mute_audio,
    :mute_video,
    :reason,
    :warning_text
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: integer() | nil,
          flag_reason: String.t() | nil,
          kick_reason: String.t() | nil,
          mute_audio: boolean() | nil,
          mute_video: boolean() | nil,
          reason: String.t() | nil,
          warning_text: String.t() | nil
        }
end
