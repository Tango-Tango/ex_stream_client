defmodule ExStreamClient.Model.ReactionGroupUserResponse do
  @moduledoc "Schema representing a ReactionGroupUserResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :user_id]
  defstruct [:created_at, :user, :user_id]
  @nested_components created_at: :datetime, user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t()
        }
end
