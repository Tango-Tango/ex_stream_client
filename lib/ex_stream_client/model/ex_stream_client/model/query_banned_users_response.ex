defmodule ExStreamClient.Model.QueryBannedUsersResponse do
  @moduledoc "Schema representing a QueryBannedUsersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:bans, :duration]
  defstruct [:duration, :bans]
  @type t :: %__MODULE__{duration: String.t(), bans: [ExStreamClient.Model.BanResponse.t()]}
end