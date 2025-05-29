defmodule ExStreamClient.Model.DeleteActivityRequest do
  @moduledoc "Schema representing a DeleteActivityRequest"
  use ExStreamClient.Jason
  defstruct [:hard_delete]
  @type t :: %__MODULE__{hard_delete: boolean() | nil}
end