defmodule ExStreamClient.Model.Poll do
  @moduledoc "Schema representing a Poll"
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
    :vote_counts_by_option
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

  @nested_components created_at: :datetime,
                     created_by: ExStreamClient.Model.User,
                     latest_answers: ExStreamClient.Model.PollVote,
                     latest_votes_by_option: {:map, {:array, ExStreamClient.Model.PollVote}},
                     options: ExStreamClient.Model.PollOption,
                     own_votes: ExStreamClient.Model.PollVote,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          allow_answers: boolean(),
          allow_user_suggested_options: boolean(),
          answers_count: integer(),
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.User.t() | nil,
          created_by_id: String.t(),
          custom: %{optional(String.t()) => any()},
          description: String.t(),
          enforce_unique_vote: boolean(),
          id: String.t(),
          is_closed: boolean() | nil,
          latest_answers: [ExStreamClient.Model.PollVote.t()],
          latest_votes_by_option: %{optional(String.t()) => [ExStreamClient.Model.PollVote.t()]},
          max_votes_allowed: integer() | nil,
          name: String.t(),
          options: [ExStreamClient.Model.PollOption.t()],
          own_votes: [ExStreamClient.Model.PollVote.t()],
          updated_at: DateTime.t() | integer() | String.t(),
          vote_count: integer(),
          vote_counts_by_option: %{optional(String.t()) => integer()},
          voting_visibility: String.t() | nil
        }
end
