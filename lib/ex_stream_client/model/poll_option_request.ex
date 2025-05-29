defmodule ExStreamClient.Model.PollOptionRequest do
  @moduledoc "Schema representing a PollOptionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:id]
  defstruct [:custom, :id, :text]
  @type t :: %__MODULE__{custom: map() | nil, id: String.t(), text: String.t() | nil}
end