defmodule ExStreamClient.Model.QueryModerationLogsResponse do
  @moduledoc "Schema representing a QueryModerationLogsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :logs]
  defstruct [:next, :prev, :duration, :logs]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t(),
          logs: [ExStreamClient.Model.ActionLogResponse.t()]
        }
end