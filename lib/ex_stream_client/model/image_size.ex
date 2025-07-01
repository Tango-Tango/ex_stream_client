defmodule ExStreamClient.Model.ImageSize do
  @moduledoc "Schema representing a ImageSize"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:crop, :height, :resize, :width]
  @nested_components crop: :enum, resize: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          crop: (:center | :right | :left | :bottom | :top) | nil,
          height: integer() | nil,
          resize: (:fill | :scale | :crop | :clip) | nil,
          width: integer() | nil
        }
end
