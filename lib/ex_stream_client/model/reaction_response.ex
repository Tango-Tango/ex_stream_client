defmodule ExStreamClient.Model.ReactionResponse do
  @moduledoc "Schema representing a ReactionResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :message_id, :score, :type, :updated_at, :user, :user_id]
  defstruct [:created_at, :custom, :message_id, :score, :type, :updated_at, :user, :user_id]

  @nested_components created_at: :datetime,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
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
          user: ExStreamClient.Model.UserResponse.t(),
          user_id: String.t()
        }
end
