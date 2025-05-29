defmodule ExStreamClient.Model.DeleteMessageRequest do
  @moduledoc "Schema representing a DeleteMessageRequest"
  use ExStreamClient.Jason
  defstruct [:hard_delete]
  @type t :: %__MODULE__{hard_delete: boolean() | nil}
end