defmodule ExStreamClient.Model.CallParticipantResponse do
  @moduledoc "Schema representing a CallParticipantResponse"
  use ExStreamClient.Jason
  @enforce_keys [:joined_at, :role, :user, :user_session_id]
  defstruct [:user, :role, :joined_at, :user_session_id]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserResponse.t(),
          role: String.t(),
          joined_at: float(),
          user_session_id: String.t()
        }
end