defmodule ExStreamClient.Model.UserIdenticalContentCountParameters do
  @moduledoc "Schema representing a UserIdenticalContentCountParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:threshold, :time_window]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{threshold: integer() | nil, time_window: String.t() | nil}
end
