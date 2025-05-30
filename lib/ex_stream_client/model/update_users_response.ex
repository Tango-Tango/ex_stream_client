defmodule ExStreamClient.Model.UpdateUsersResponse do
  @moduledoc "Schema representing a UpdateUsersResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :membership_deletion_task_id, :users]
  defstruct [:duration, :membership_deletion_task_id, :users]
  @nested_components users: {:map, ExStreamClient.Model.FullUserResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          membership_deletion_task_id: String.t(),
          users: %{optional(String.t()) => ExStreamClient.Model.FullUserResponse.t()}
        }
end
