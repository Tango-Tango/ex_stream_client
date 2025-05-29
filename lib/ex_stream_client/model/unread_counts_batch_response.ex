defmodule ExStreamClient.Model.UnreadCountsBatchResponse do
  @moduledoc "Schema representing a UnreadCountsBatchResponse"
  use ExStreamClient.Jason
  @enforce_keys [:counts_by_user, :duration]
  defstruct [:duration, :counts_by_user]
  @type t :: %__MODULE__{duration: String.t(), counts_by_user: map()}
end