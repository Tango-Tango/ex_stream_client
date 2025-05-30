defmodule ExStreamClient.Model.CastPollVoteRequest do
  @moduledoc "Schema representing a CastPollVoteRequest"
  use ExStreamClient.Jason
  defstruct [:user, :user_id, :vote]
  @nested_components user: ExStreamClient.Model.UserRequest, vote: ExStreamClient.Model.VoteData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          vote: ExStreamClient.Model.VoteData.t() | nil
        }
end
