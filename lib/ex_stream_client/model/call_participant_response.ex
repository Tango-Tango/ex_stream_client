defmodule ExStreamClient.Model.CallParticipantResponse do
  @moduledoc "Schema representing a CallParticipantResponse"
  use ExStreamClient.Jason
  @enforce_keys [:joined_at, :role, :user, :user_session_id]
  defstruct [:joined_at, :role, :user, :user_session_id]

  @type t :: %__MODULE__{
          joined_at: float(),
          role: String.t(),
          user: ExStreamClient.Model.UserResponse.t(),
          user_session_id: String.t()
        }
end