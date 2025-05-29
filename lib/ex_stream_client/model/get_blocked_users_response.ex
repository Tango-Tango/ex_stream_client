defmodule ExStreamClient.Model.GetBlockedUsersResponse do
  @moduledoc "Schema representing a GetBlockedUsersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:blocks, :duration]
  defstruct [:blocks, :duration]

  @type t :: %__MODULE__{
          blocks: [ExStreamClient.Model.BlockedUserResponse.t()],
          duration: String.t()
        }
end