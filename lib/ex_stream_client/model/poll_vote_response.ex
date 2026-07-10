defmodule ExStreamClient.Model.PollVoteResponse do
  @moduledoc "Schema representing a PollVoteResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :poll, :vote]

  @nested_components poll: ExStreamClient.Model.PollResponseData,
                     vote: ExStreamClient.Model.PollVoteResponseData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          poll: ExStreamClient.Model.PollResponseData.t() | nil,
          vote: ExStreamClient.Model.PollVoteResponseData.t() | nil
        }
end
