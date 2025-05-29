defmodule ExStreamClient.Model.MuteResponse do
  @moduledoc "Schema representing a MuteResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :mutes, :non_existing_users, :own_user]

  @type t :: %__MODULE__{
          duration: String.t(),
          mutes: [ExStreamClient.Model.UserMute.t()] | nil,
          non_existing_users: [String.t()] | nil,
          own_user: ExStreamClient.Model.OwnUser.t() | nil
        }
end