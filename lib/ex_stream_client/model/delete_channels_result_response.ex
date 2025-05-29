defmodule ExStreamClient.Model.DeleteChannelsResultResponse do
  @moduledoc "Schema representing a DeleteChannelsResultResponse"
  use ExStreamClient.Jason
  @enforce_keys [:status]
  defstruct [:error, :status]
  @type t :: %__MODULE__{error: String.t() | nil, status: String.t()}
end