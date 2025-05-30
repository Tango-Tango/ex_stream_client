defmodule ExStreamClient.Model.Quality do
  @moduledoc "Schema representing a Quality"
  use ExStreamClient.Jason
  defstruct [:bitdepth, :framerate, :height, :name, :video_bitrate, :width]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          bitdepth: integer() | nil,
          framerate: integer() | nil,
          height: integer() | nil,
          name: String.t() | nil,
          video_bitrate: integer() | nil,
          width: integer() | nil
        }
end
