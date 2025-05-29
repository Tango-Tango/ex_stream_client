defmodule ExStreamClient.Model.ReactionResponse do
  @moduledoc "Schema representing a ReactionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :message_id, :score, :type, :updated_at, :user, :user_id]
  defstruct [:type, :user, :custom, :created_at, :user_id, :updated_at, :message_id, :score]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.UserResponse.t(),
          custom: map(),
          created_at: float(),
          user_id: String.t(),
          updated_at: float(),
          message_id: String.t(),
          score: integer()
        }
end