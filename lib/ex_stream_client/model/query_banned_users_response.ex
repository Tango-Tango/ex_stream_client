defmodule ExStreamClient.Model.QueryBannedUsersResponse do
  @moduledoc "Schema representing a QueryBannedUsersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:bans, :duration]
  defstruct [:bans, :duration]
  @nested_components %{bans: ExStreamClient.Model.BanResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{bans: [ExStreamClient.Model.BanResponse.t()], duration: String.t()}
end
