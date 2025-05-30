defmodule ExStreamClient.Model.Action do
  @moduledoc "Schema representing a Action"
  use ExStreamClient.Jason
  @enforce_keys [:name, :text, :type]
  defstruct [:name, :style, :text, :type, :value]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          name: String.t(),
          style: String.t() | nil,
          text: String.t(),
          type: String.t(),
          value: String.t() | nil
        }
end
