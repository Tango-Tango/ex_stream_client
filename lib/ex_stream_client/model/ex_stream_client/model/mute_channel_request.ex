defmodule ExStreamClient.Model.MuteChannelRequest do
  @moduledoc "Schema representing a MuteChannelRequest"
  use ExStreamClient.Jason
  defstruct [:user, :user_id, :channel_cids, :expiration]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          channel_cids: [String.t()] | nil,
          expiration: integer() | nil
        }
end