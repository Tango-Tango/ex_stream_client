defmodule ExStreamClient.Model.EgressUser do
  @moduledoc "Schema representing a EgressUser"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:token]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{token: String.t() | nil}
end
