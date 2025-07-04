defmodule ExStreamClient.Model.BlockedUserResponse do
  @moduledoc "Schema representing a BlockedUserResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:blocked_user, :blocked_user_id, :created_at, :user, :user_id]
  defstruct [:blocked_user, :blocked_user_id, :created_at, :user, :user_id]

  @nested_components blocked_user: ExStreamClient.Model.UserResponse,
                     created_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocked_user: ExStreamClient.Model.UserResponse.t(),
          blocked_user_id: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.UserResponse.t(),
          user_id: String.t()
        }
end
