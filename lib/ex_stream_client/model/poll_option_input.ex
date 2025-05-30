defmodule ExStreamClient.Model.PollOptionInput do
  @moduledoc "Schema representing a PollOptionInput"
  use ExStreamClient.Jason
  defstruct [:custom, :text]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{custom: map() | nil, text: String.t() | nil}
end
