defmodule ExStreamClient.Model.QueryBannedUsersResponse do
  @moduledoc "Schema representing a QueryBannedUsersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:bans, :duration]
  defstruct [:bans, :duration]
  @type t :: %__MODULE__{bans: [ExStreamClient.Model.BanResponse.t()], duration: String.t()}
end