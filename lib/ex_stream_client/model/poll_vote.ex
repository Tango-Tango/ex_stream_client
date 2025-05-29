defmodule ExStreamClient.Model.PollVote do
  @moduledoc "Schema representing a PollVote"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :id, :option_id, :poll_id, :updated_at]
  defstruct [
    :id,
    :user,
    :created_at,
    :user_id,
    :updated_at,
    :poll_id,
    :option_id,
    :answer_text,
    :is_answer
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          created_at: float(),
          user_id: String.t() | nil,
          updated_at: float(),
          poll_id: String.t(),
          option_id: String.t(),
          answer_text: String.t() | nil,
          is_answer: boolean() | nil
        }
end