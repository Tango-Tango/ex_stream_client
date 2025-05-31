defmodule ExStreamClient.Model.UnmuteResponse do
  @moduledoc "Schema representing a UnmuteResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :non_existing_users]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), non_existing_users: [String.t()] | nil}
end
