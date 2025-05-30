defmodule ExStreamClient.Model.BlockedUserResponse do
  @moduledoc "Schema representing a BlockedUserResponse"
  use ExStreamClient.Jason
  @enforce_keys [:blocked_user, :blocked_user_id, :created_at, :user, :user_id]
  defstruct [:blocked_user, :blocked_user_id, :created_at, :user, :user_id]

  @nested_components %{
    user: ExStreamClient.Model.UserResponse,
    blocked_user: ExStreamClient.Model.UserResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocked_user: ExStreamClient.Model.UserResponse.t(),
          blocked_user_id: String.t(),
          created_at: float(),
          user: ExStreamClient.Model.UserResponse.t(),
          user_id: String.t()
        }
end
