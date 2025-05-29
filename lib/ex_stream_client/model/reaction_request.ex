defmodule ExStreamClient.Model.ReactionRequest do
  @moduledoc "Schema representing a ReactionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:type]
  defstruct [:type, :user, :custom, :created_at, :user_id, :updated_at, :score]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          custom: map() | nil,
          created_at: float() | nil,
          user_id: String.t() | nil,
          updated_at: float() | nil,
          score: integer() | nil
        }
end