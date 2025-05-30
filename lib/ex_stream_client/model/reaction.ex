defmodule ExStreamClient.Model.Reaction do
  @moduledoc "Schema representing a Reaction"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :message_id, :score, :type, :updated_at]
  defstruct [:created_at, :custom, :message_id, :score, :type, :updated_at, :user, :user_id]
  @nested_components %{user: ExStreamClient.Model.User}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          custom: map(),
          message_id: String.t(),
          score: integer(),
          type: String.t(),
          updated_at: float(),
          user: ExStreamClient.Model.User.t() | nil,
          user_id: String.t() | nil
        }
end
