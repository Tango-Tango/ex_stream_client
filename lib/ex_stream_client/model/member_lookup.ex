defmodule ExStreamClient.Model.MemberLookup do
  @moduledoc "Schema representing a MemberLookup"
  use ExStreamClient.Jason
  @enforce_keys [:limit]
  defstruct [:limit]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{limit: integer()}
end
