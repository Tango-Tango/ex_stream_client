defmodule ExStreamClient.Model.ImageSize do
  @moduledoc "Schema representing a ImageSize"
  use ExStreamClient.Jason
  defstruct [:width, :crop, :height, :resize]

  @type t :: %__MODULE__{
          width: integer() | nil,
          crop: (:center | :right | :left | :bottom | :top) | nil,
          height: integer() | nil,
          resize: (:fill | :scale | :crop | :clip) | nil
        }
end