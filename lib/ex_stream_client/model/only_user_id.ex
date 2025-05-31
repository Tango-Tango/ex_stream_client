defmodule ExStreamClient.Model.OnlyUserID do
  @moduledoc "Schema representing a OnlyUserID"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:id]
  defstruct [:id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{id: String.t()}
end
