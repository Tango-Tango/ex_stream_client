defmodule ExStreamClient.Model.Reaction do
  @moduledoc "Schema representing a Reaction"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :message_id, :score, :type, :updated_at]
  defstruct [:type, :user, :custom, :created_at, :user_id, :updated_at, :message_id, :score]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          custom: map(),
          created_at: float(),
          user_id: String.t() | nil,
          updated_at: float(),
          message_id: String.t(),
          score: integer()
        }
end