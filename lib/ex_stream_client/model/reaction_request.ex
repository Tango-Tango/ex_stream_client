defmodule ExStreamClient.Model.ReactionRequest do
  @moduledoc "Schema representing a ReactionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:type]
  defstruct [:created_at, :custom, :score, :type, :updated_at, :user, :user_id]
  @nested_components %{user: ExStreamClient.Model.UserRequest}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float() | nil,
          custom: map() | nil,
          score: integer() | nil,
          type: String.t(),
          updated_at: float() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
