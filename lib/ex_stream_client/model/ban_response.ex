defmodule ExStreamClient.Model.BanResponse do
  @moduledoc "Schema representing a BanResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at]
  defstruct [:reason, :user, :shadow, :channel, :created_at, :expires, :banned_by]

  @type t :: %__MODULE__{
          reason: String.t() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil,
          shadow: boolean() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          created_at: float(),
          expires: float() | nil,
          banned_by: ExStreamClient.Model.UserResponse.t() | nil
        }
end