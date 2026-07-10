defmodule ExStreamClient.Model.ValidateExternalStorageResponse do
  @moduledoc "Schema representing a ValidateExternalStorageResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t()}
end
