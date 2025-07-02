defmodule ExStreamClient.Model.BanResponse do
  @moduledoc "Schema representing a BanResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at]
  defstruct [:banned_by, :channel, :created_at, :expires, :reason, :shadow, :user]

  @nested_components banned_by: ExStreamClient.Model.UserResponse,
                     channel: ExStreamClient.Model.ChannelResponse,
                     created_at: :datetime,
                     expires: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          banned_by: ExStreamClient.Model.UserResponse.t() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          expires: (DateTime.t() | integer() | String.t()) | nil,
          reason: String.t() | nil,
          shadow: boolean() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
