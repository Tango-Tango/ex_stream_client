defmodule ExStreamClient.Model.Response do
  @moduledoc "Schema representing a Response"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t()}
end
