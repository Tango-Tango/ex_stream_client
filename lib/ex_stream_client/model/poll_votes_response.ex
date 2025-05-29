defmodule ExStreamClient.Model.PollVotesResponse do
  @moduledoc "Schema representing a PollVotesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :votes]
  defstruct [:duration, :next, :prev, :votes]

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil,
          votes: [ExStreamClient.Model.PollVoteResponseData.t()]
        }
end