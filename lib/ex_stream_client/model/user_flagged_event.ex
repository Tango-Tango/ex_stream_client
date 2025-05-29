defmodule ExStreamClient.Model.UserFlaggedEvent do
  @moduledoc "Schema representing a UserFlaggedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:type, :user, :created_at, :target_user, :target_users]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          created_at: float(),
          target_user: String.t() | nil,
          target_users: [String.t()] | nil
        }
end