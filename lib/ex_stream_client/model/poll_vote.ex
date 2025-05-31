defmodule ExStreamClient.Model.PollVote do
  @moduledoc "Schema representing a PollVote"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :id, :option_id, :poll_id, :updated_at]
  defstruct [
    :answer_text,
    :created_at,
    :id,
    :is_answer,
    :option_id,
    :poll_id,
    :updated_at,
    :user,
    :user_id
  ]

  @nested_components user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          answer_text: String.t() | nil,
          created_at: float(),
          id: String.t(),
          is_answer: boolean() | nil,
          option_id: String.t(),
          poll_id: String.t(),
          updated_at: float(),
          user: ExStreamClient.Model.User.t() | nil,
          user_id: String.t() | nil
        }
end
