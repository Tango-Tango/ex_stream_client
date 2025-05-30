defmodule ExStreamClient.Model.UpdateMemberPartialRequest do
  @moduledoc "Schema representing a UpdateMemberPartialRequest"
  use ExStreamClient.Jason
  defstruct [:set, :unset]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{set: map() | nil, unset: [String.t()] | nil}
end
