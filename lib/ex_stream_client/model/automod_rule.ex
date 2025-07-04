defmodule ExStreamClient.Model.AutomodRule do
  @moduledoc "Schema representing a AutomodRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :label, :threshold]
  defstruct [:action, :label, :threshold]
  @nested_components action: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: :bounce_remove | :bounce_flag | :bounce | :remove | :shadow | :flag,
          label: String.t(),
          threshold: float()
        }
end
