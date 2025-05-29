defmodule ExStreamClient.Model.Quality do
  @moduledoc "Schema representing a Quality"
  use ExStreamClient.Jason
  defstruct [:name, :width, :height, :bitdepth, :framerate, :video_bitrate]

  @type t :: %__MODULE__{
          name: String.t() | nil,
          width: integer() | nil,
          height: integer() | nil,
          bitdepth: integer() | nil,
          framerate: integer() | nil,
          video_bitrate: integer() | nil
        }
end