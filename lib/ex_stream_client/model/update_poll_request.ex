defmodule ExStreamClient.Model.UpdatePollRequest do
  @moduledoc "Schema representing a UpdatePollRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:id, :name]
  defstruct [
    :allow_answers,
    :allow_user_suggested_options,
    :custom,
    :description,
    :enforce_unique_vote,
    :id,
    :is_closed,
    :max_votes_allowed,
    :name,
    :options,
    :user,
    :user_id,
    :voting_visibility
  ]

  @nested_components options: ExStreamClient.Model.PollOptionRequest,
                     user: ExStreamClient.Model.UserRequest,
                     voting_visibility: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          allow_answers: boolean() | nil,
          allow_user_suggested_options: boolean() | nil,
          custom: %{optional(String.t()) => any()} | nil,
          description: String.t() | nil,
          enforce_unique_vote: boolean() | nil,
          id: String.t(),
          is_closed: boolean() | nil,
          max_votes_allowed: integer() | nil,
          name: String.t(),
          options: [ExStreamClient.Model.PollOptionRequest.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          voting_visibility: (:public | :anonymous) | nil
        }
end
