defmodule ExStreamClient.Model.ChannelMute do
  @moduledoc "Schema representing a ChannelMute"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :updated_at]
  defstruct [:channel, :created_at, :expires, :updated_at, :user]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          created_at: float(),
          expires: float() | nil,
          updated_at: float(),
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
