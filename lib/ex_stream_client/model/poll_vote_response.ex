defmodule ExStreamClient.Model.PollVoteResponse do
  @moduledoc "Schema representing a PollVoteResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :vote]
  @nested_components vote: ExStreamClient.Model.PollVoteResponseData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          vote: ExStreamClient.Model.PollVoteResponseData.t() | nil
        }
end
