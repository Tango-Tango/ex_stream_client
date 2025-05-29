defmodule ExStreamClient.Model.MuteResponse do
  @moduledoc "Schema representing a MuteResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :mutes, :own_user, :non_existing_users]

  @type t :: %__MODULE__{
          duration: String.t(),
          mutes: [ExStreamClient.Model.UserMute.t()] | nil,
          own_user: ExStreamClient.Model.OwnUser.t() | nil,
          non_existing_users: [String.t()] | nil
        }
end