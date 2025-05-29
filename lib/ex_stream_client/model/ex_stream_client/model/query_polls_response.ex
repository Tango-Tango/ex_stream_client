defmodule ExStreamClient.Model.QueryPollsResponse do
  @moduledoc "Schema representing a QueryPollsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :polls]
  defstruct [:next, :prev, :duration, :polls]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t(),
          polls: [ExStreamClient.Model.PollResponseData.t()]
        }
end