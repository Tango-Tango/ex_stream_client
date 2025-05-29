defmodule ExStreamClient.Model.BlockedUserResponse do
  @moduledoc "Schema representing a BlockedUserResponse"
  use ExStreamClient.Jason
  @enforce_keys [:blocked_user, :blocked_user_id, :created_at, :user, :user_id]
  defstruct [:user, :created_at, :user_id, :blocked_user_id, :blocked_user]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserResponse.t(),
          created_at: float(),
          user_id: String.t(),
          blocked_user_id: String.t(),
          blocked_user: ExStreamClient.Model.UserResponse.t()
        }
end