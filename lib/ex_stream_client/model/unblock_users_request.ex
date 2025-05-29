defmodule ExStreamClient.Model.UnblockUsersRequest do
  @moduledoc "Schema representing a UnblockUsersRequest"
  use ExStreamClient.Jason
  @enforce_keys [:blocked_user_id]
  defstruct [:blocked_user_id, :user, :user_id]

  @type t :: %__MODULE__{
          blocked_user_id: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end