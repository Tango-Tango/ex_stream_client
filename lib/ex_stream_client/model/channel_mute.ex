defmodule ExStreamClient.Model.ChannelMute do
  @moduledoc "Schema representing a ChannelMute"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :updated_at]
  defstruct [:channel, :created_at, :expires, :updated_at, :user]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     created_at: :datetime,
                     expires: :datetime,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          expires: (DateTime.t() | integer() | String.t()) | nil,
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
