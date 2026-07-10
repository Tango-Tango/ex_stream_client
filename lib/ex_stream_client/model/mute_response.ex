defmodule ExStreamClient.Model.MuteResponse do
  @moduledoc "Schema representing a MuteResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :mutes, :non_existing_users, :own_user]

  @nested_components mutes: ExStreamClient.Model.UserMuteResponse,
                     own_user: ExStreamClient.Model.OwnUserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          mutes: [ExStreamClient.Model.UserMuteResponse.t()] | nil,
          non_existing_users: [String.t()] | nil,
          own_user: ExStreamClient.Model.OwnUserResponse.t() | nil
        }
end
