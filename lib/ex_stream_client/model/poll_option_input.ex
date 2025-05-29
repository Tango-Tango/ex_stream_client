defmodule ExStreamClient.Model.PollOptionInput do
  @moduledoc "Schema representing a PollOptionInput"
  use ExStreamClient.Jason
  defstruct [:text, :custom]
  @type t :: %__MODULE__{text: String.t() | nil, custom: map() | nil}
end