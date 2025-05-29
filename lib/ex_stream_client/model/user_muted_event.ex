defmodule ExStreamClient.Model.UserMutedEvent do
  @moduledoc "Schema representing a UserMutedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:created_at, :target_user, :target_users, :type, :user]

  @type t :: %__MODULE__{
          created_at: float(),
          target_user: String.t() | nil,
          target_users: [String.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end