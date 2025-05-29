defmodule ExStreamClient.Model.QueryModerationLogsResponse do
  @moduledoc "Schema representing a QueryModerationLogsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :logs]
  defstruct [:duration, :logs, :next, :prev]

  @type t :: %__MODULE__{
          duration: String.t(),
          logs: [ExStreamClient.Model.ActionLogResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil
        }
end