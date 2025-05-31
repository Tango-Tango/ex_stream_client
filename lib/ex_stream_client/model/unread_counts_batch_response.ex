defmodule ExStreamClient.Model.UnreadCountsBatchResponse do
  @moduledoc "Schema representing a UnreadCountsBatchResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:counts_by_user, :duration]
  defstruct [:counts_by_user, :duration]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{counts_by_user: map(), duration: String.t()}
end
