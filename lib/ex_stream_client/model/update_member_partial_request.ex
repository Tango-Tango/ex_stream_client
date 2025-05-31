defmodule ExStreamClient.Model.UpdateMemberPartialRequest do
  @moduledoc "Schema representing a UpdateMemberPartialRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:set, :unset]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{set: %{optional(String.t()) => any()} | nil, unset: [String.t()] | nil}
end
