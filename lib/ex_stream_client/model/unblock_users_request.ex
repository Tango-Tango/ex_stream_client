defmodule ExStreamClient.Model.UnblockUsersRequest do
  @moduledoc "Schema representing a UnblockUsersRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:blocked_user_id]
  defstruct [:blocked_user_id, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocked_user_id: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
