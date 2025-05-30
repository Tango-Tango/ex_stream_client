defmodule ExStreamClient.Model.OCRRule do
  @moduledoc "Schema representing a OCRRule"
  use ExStreamClient.Jason
  @enforce_keys [:action, :label]
  defstruct [:action, :label]
  @nested_components %{action: :atom}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          label: String.t()
        }
end
