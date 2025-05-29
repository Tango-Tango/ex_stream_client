defmodule ExStreamClient.Model.UnblockUsersRequest do
  @moduledoc "Schema representing a UnblockUsersRequest"
  use ExStreamClient.Jason
  @enforce_keys [:blocked_user_id]
  defstruct [:user, :user_id, :blocked_user_id]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          blocked_user_id: String.t()
        }
end