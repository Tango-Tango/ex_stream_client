defmodule ExStreamClient.Model.ImageSize do
  @moduledoc "Schema representing a ImageSize"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:crop, :height, :resize, :width]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          crop: String.t() | nil,
          height: integer() | nil,
          resize: String.t() | nil,
          width: integer() | nil
        }
end
