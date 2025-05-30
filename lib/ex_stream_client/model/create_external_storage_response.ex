defmodule ExStreamClient.Model.CreateExternalStorageResponse do
  @moduledoc "Schema representing a CreateExternalStorageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t()}
end
