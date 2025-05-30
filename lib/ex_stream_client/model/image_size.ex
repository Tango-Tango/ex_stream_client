defmodule ExStreamClient.Model.ImageSize do
  @moduledoc "Schema representing a ImageSize"
  use ExStreamClient.Jason
  defstruct [:crop, :height, :resize, :width]
  @nested_components %{crop: :atom, resize: :atom}
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
