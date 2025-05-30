defmodule ExStreamClient.Model.PollOptionInput do
  @moduledoc "Schema representing a PollOptionInput"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:custom, :text]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{custom: %{optional(String.t()) => any()} | nil, text: String.t() | nil}
end
