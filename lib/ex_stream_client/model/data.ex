defmodule ExStreamClient.Model.Data do
  @moduledoc "Schema representing a Data"
  use ExStreamClient.Jason
  @enforce_keys [:id]
  defstruct [:id]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{id: String.t()}
end
