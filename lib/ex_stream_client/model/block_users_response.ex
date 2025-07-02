defmodule ExStreamClient.Model.BlockUsersResponse do
  @moduledoc "Schema representing a BlockUsersResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:blocked_by_user_id, :blocked_user_id, :created_at, :duration]
  defstruct [:blocked_by_user_id, :blocked_user_id, :created_at, :duration]
  @nested_components created_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocked_by_user_id: String.t(),
          blocked_user_id: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          duration: String.t()
        }
end
