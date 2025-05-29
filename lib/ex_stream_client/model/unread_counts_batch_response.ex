defmodule ExStreamClient.Model.UnreadCountsBatchResponse do
  @moduledoc "Schema representing a UnreadCountsBatchResponse"
  use ExStreamClient.Jason
  @enforce_keys [:counts_by_user, :duration]
  defstruct [:counts_by_user, :duration]
  @type t :: %__MODULE__{counts_by_user: map(), duration: String.t()}
end