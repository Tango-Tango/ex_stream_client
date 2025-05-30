defmodule ExStreamClient.Model.GetBlockedUsersResponse do
  @moduledoc "Schema representing a GetBlockedUsersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:blocks, :duration]
  defstruct [:blocks, :duration]
  @nested_components %{blocks: ExStreamClient.Model.BlockedUserResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocks: [ExStreamClient.Model.BlockedUserResponse.t()],
          duration: String.t()
        }
end
