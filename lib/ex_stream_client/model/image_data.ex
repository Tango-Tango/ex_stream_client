defmodule ExStreamClient.Model.ImageData do
  @moduledoc "Schema representing a ImageData"
  use ExStreamClient.Jason
  @enforce_keys [:frames, :height, :size, :url, :width]
  defstruct [:frames, :height, :size, :url, :width]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          frames: String.t(),
          height: String.t(),
          size: String.t(),
          url: String.t(),
          width: String.t()
        }
end
