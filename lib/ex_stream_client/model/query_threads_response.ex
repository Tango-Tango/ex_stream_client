defmodule ExStreamClient.Model.QueryThreadsResponse do
  @moduledoc "Schema representing a QueryThreadsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :threads]
  defstruct [:threads, :next, :prev, :duration]

  @type t :: %__MODULE__{
          threads: [ExStreamClient.Model.ThreadStateResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t()
        }
end