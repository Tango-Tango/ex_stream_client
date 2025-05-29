defmodule ExStreamClient.Model.BlockUsersResponse do
  @moduledoc "Schema representing a BlockUsersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:blocked_by_user_id, :blocked_user_id, :created_at, :duration]
  defstruct [:duration, :created_at, :blocked_by_user_id, :blocked_user_id]

  @type t :: %__MODULE__{
          duration: String.t(),
          created_at: float(),
          blocked_by_user_id: String.t(),
          blocked_user_id: String.t()
        }
end