defmodule ExStreamClient.Model.DeleteReactionRequest do
  @moduledoc "Schema representing a DeleteReactionRequest"
  use ExStreamClient.Jason
  defstruct [:hard_delete]
  @type t :: %__MODULE__{hard_delete: boolean() | nil}
end