defmodule ExStreamClient.Model.CallMember do
  @moduledoc "Schema representing a CallMember"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :role, :updated_at, :user_id]
  defstruct [:created_at, :custom, :deleted_at, :role, :updated_at, :user, :user_id]

  @type t :: %__MODULE__{
          created_at: float(),
          custom: map(),
          deleted_at: float() | nil,
          role: String.t(),
          updated_at: float(),
          user: ExStreamClient.Model.User.t() | nil,
          user_id: String.t()
        }
end