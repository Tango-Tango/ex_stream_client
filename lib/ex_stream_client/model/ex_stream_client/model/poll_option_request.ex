defmodule ExStreamClient.Model.PollOptionRequest do
  @moduledoc "Schema representing a PollOptionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:id]
  defstruct [:id, :text, :custom]
  @type t :: %__MODULE__{id: String.t(), text: String.t() | nil, custom: map() | nil}
end