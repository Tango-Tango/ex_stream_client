defmodule ExStreamClient.Model.PollVotesResponse do
  @moduledoc "Schema representing a PollVotesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :votes]
  defstruct [:next, :prev, :duration, :votes]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t(),
          votes: [ExStreamClient.Model.PollVoteResponseData.t()]
        }
end