defmodule ExStreamClient.Model.IngressVideoLayer do
  @moduledoc "Schema representing a IngressVideoLayer"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:bitrate, :codec, :frame_rate, :max_dimension, :min_dimension]
  defstruct [:bitrate, :codec, :frame_rate, :max_dimension, :min_dimension]
  @nested_components codec: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          bitrate: integer(),
          codec: :vp8 | :h264,
          frame_rate: integer(),
          max_dimension: integer(),
          min_dimension: integer()
        }
end
