defmodule ExStreamClient.Model.CreatePollRequest do
  @moduledoc "Schema representing a CreatePollRequest"
  use ExStreamClient.Jason
  @enforce_keys [:name]
  defstruct [
    :id,
    :name,
    :user,
    :options,
    :description,
    :custom,
    :allow_answers,
    :allow_user_suggested_options,
    :enforce_unique_vote,
    :is_closed,
    :max_votes_allowed,
    :user_id,
    :voting_visibility
  ]

  @type t :: %__MODULE__{
          id: String.t() | nil,
          name: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          options: [ExStreamClient.Model.PollOptionInput.t()] | nil,
          description: String.t() | nil,
          custom: map() | nil,
          allow_answers: boolean() | nil,
          allow_user_suggested_options: boolean() | nil,
          enforce_unique_vote: boolean() | nil,
          is_closed: boolean() | nil,
          max_votes_allowed: integer() | nil,
          user_id: String.t() | nil,
          voting_visibility: (:public | :anonymous) | nil
        }
end