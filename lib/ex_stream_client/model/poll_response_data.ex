defmodule ExStreamClient.Model.PollResponseData do
  @moduledoc "Schema representing a PollResponseData"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :allow_answers,
    :allow_user_suggested_options,
    :answers_count,
    :created_at,
    :created_by_id,
    :custom,
    :description,
    :enforce_unique_vote,
    :id,
    :latest_answers,
    :latest_votes_by_option,
    :name,
    :options,
    :own_votes,
    :updated_at,
    :vote_count,
    :vote_counts_by_option,
    :voting_visibility
  ]
  defstruct [
    :allow_answers,
    :allow_user_suggested_options,
    :answers_count,
    :created_at,
    :created_by,
    :created_by_id,
    :custom,
    :description,
    :enforce_unique_vote,
    :id,
    :is_closed,
    :latest_answers,
    :latest_votes_by_option,
    :max_votes_allowed,
    :name,
    :options,
    :own_votes,
    :updated_at,
    :vote_count,
    :vote_counts_by_option,
    :voting_visibility
  ]

  @nested_components created_by: ExStreamClient.Model.UserResponse,
                     latest_answers: ExStreamClient.Model.PollVoteResponseData,
                     options: ExStreamClient.Model.PollOptionResponseData,
                     own_votes: ExStreamClient.Model.PollVoteResponseData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          allow_answers: boolean(),
          allow_user_suggested_options: boolean(),
          answers_count: integer(),
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          created_by_id: String.t(),
          custom: map(),
          description: String.t(),
          enforce_unique_vote: boolean(),
          id: String.t(),
          is_closed: boolean() | nil,
          latest_answers: [ExStreamClient.Model.PollVoteResponseData.t()],
          latest_votes_by_option: map(),
          max_votes_allowed: integer() | nil,
          name: String.t(),
          options: [ExStreamClient.Model.PollOptionResponseData.t()],
          own_votes: [ExStreamClient.Model.PollVoteResponseData.t()],
          updated_at: float(),
          vote_count: integer(),
          vote_counts_by_option: map(),
          voting_visibility: String.t()
        }
end
