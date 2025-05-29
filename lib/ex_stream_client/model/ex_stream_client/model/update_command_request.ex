defmodule ExStreamClient.Model.UpdateCommandRequest do
  @moduledoc "Schema representing a UpdateCommandRequest"
  use ExStreamClient.Jason
  @enforce_keys [:description]
  defstruct [:args, :set, :description]
  @type t :: %__MODULE__{args: String.t() | nil, set: String.t() | nil, description: String.t()}
end