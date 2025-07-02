defmodule ExStreamClient.Model.Reaction do
  @moduledoc "Schema representing a Reaction"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :message_id, :score, :type, :updated_at]
  defstruct [:created_at, :custom, :message_id, :score, :type, :updated_at, :user, :user_id]
  @nested_components created_at: :datetime, updated_at: :datetime, user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          message_id: String.t(),
          score: integer(),
          type: String.t(),
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          user_id: String.t() | nil
        }
end
