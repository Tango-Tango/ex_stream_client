defmodule ExStreamClient.Model.ImageData do
  @moduledoc "Schema representing a ImageData"
  use ExStreamClient.Jason
  @enforce_keys [:frames, :height, :size, :url, :width]
  defstruct [:size, :width, :url, :frames, :height]

  @type t :: %__MODULE__{
          size: String.t(),
          width: String.t(),
          url: String.t(),
          frames: String.t(),
          height: String.t()
        }
end