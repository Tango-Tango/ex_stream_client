defmodule ExStreamClient.Model.ImageSize do
  @moduledoc "Schema representing a ImageSize"
  use ExStreamClient.Jason
  defstruct [:crop, :height, :resize, :width]

  @type t :: %__MODULE__{
          crop: (:center | :right | :left | :bottom | :top) | nil,
          height: integer() | nil,
          resize: (:fill | :scale | :crop | :clip) | nil,
          width: integer() | nil
        }
end