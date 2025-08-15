defmodule ExStreamClient.Model.IngressVideoLayerResponse do
  @moduledoc "Schema representing a IngressVideoLayerResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:bitrate, :codec, :frame_rate_limit, :max_dimension, :min_dimension]
  defstruct [:bitrate, :codec, :frame_rate_limit, :max_dimension, :min_dimension]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          bitrate: integer(),
          codec: String.t(),
          frame_rate_limit: integer(),
          max_dimension: integer(),
          min_dimension: integer()
        }
end
