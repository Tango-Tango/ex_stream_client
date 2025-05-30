defmodule ExStreamClient.Model.PollVotesResponse do
  @moduledoc "Schema representing a PollVotesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :votes]
  defstruct [:duration, :next, :prev, :votes]
  @nested_components votes: ExStreamClient.Model.PollVoteResponseData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil,
          votes: [ExStreamClient.Model.PollVoteResponseData.t()]
        }
end
