defmodule ExStreamClient.Model.PollOptionResponseData do
  @moduledoc "Schema representing a PollOptionResponseData"
  use ExStreamClient.Jason
  @enforce_keys [:custom, :id, :text]
  defstruct [:custom, :id, :text]
  @type t :: %__MODULE__{custom: map(), id: String.t(), text: String.t()}
end