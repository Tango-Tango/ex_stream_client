defmodule ExStreamClient.Model.Poll do
  @moduledoc "Schema representing a Poll"
  use ExStreamClient.Jason

  @enforce_keys [
    :custom,
    :allow_answers,
    :allow_user_suggested_options,
    :answers_count,
    :created_at,
    :created_by_id,
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
    :vote_counts_by_option
  ]
  defstruct [
    :id,
    :name,
    :options,
    :description,
    :custom,
    :created_at,
    :created_by,
    :allow_answers,
    :allow_user_suggested_options,
    :enforce_unique_vote,
    :is_closed,
    :max_votes_allowed,
    :voting_visibility,
    :answers_count,
    :created_by_id,
    :latest_answers,
    :latest_votes_by_option,
    :own_votes,
    :updated_at,
    :vote_count,
    :vote_counts_by_option
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          options: [ExStreamClient.Model.PollOption.t()],
          description: String.t(),
          custom: map(),
          created_at: float(),
          created_by: ExStreamClient.Model.User.t() | nil,
          allow_answers: boolean(),
          allow_user_suggested_options: boolean(),
          enforce_unique_vote: boolean(),
          is_closed: boolean() | nil,
          max_votes_allowed: integer() | nil,
          voting_visibility: String.t() | nil,
          answers_count: integer(),
          created_by_id: String.t(),
          latest_answers: [ExStreamClient.Model.PollVote.t()],
          latest_votes_by_option: map(),
          own_votes: [ExStreamClient.Model.PollVote.t()],
          updated_at: float(),
          vote_count: integer(),
          vote_counts_by_option: map()
        }
end