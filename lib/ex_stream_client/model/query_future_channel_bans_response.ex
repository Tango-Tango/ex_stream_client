defmodule ExStreamClient.Model.QueryFutureChannelBansResponse do
  @moduledoc "Schema representing a QueryFutureChannelBansResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:bans, :duration]
  defstruct [:bans, :duration]
  @nested_components bans: ExStreamClient.Model.FutureChannelBanResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          bans: [ExStreamClient.Model.FutureChannelBanResponse.t()],
          duration: String.t()
        }
end
