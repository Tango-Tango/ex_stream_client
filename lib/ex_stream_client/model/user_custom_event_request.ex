defmodule ExStreamClient.Model.UserCustomEventRequest do
  @moduledoc "Schema representing a UserCustomEventRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:type]
  defstruct [:custom, :type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{custom: map() | nil, type: String.t()}
end
