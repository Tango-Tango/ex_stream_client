defmodule ExStreamClient.Model.UpdateUsersResponse do
  @moduledoc "Schema representing a UpdateUsersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :membership_deletion_task_id, :users]
  defstruct [:duration, :users, :membership_deletion_task_id]

  @type t :: %__MODULE__{
          duration: String.t(),
          users: map(),
          membership_deletion_task_id: String.t()
        }
end