defmodule ExStreamClient.Model.CallMember do
  @moduledoc "Schema representing a CallMember"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :role, :updated_at, :user_id]
  defstruct [:user, :role, :custom, :created_at, :user_id, :updated_at, :deleted_at]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.User.t() | nil,
          role: String.t(),
          custom: map(),
          created_at: float(),
          user_id: String.t(),
          updated_at: float(),
          deleted_at: float() | nil
        }
end