defmodule ExStreamClient.Model.PollOptionInput do
  @moduledoc "Schema representing a PollOptionInput"
  use ExStreamClient.Jason
  defstruct [:custom, :text]
  @type t :: %__MODULE__{custom: map() | nil, text: String.t() | nil}
end