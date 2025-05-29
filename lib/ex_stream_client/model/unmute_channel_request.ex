defmodule ExStreamClient.Model.UnmuteChannelRequest do
  @moduledoc "Schema representing a UnmuteChannelRequest"
  use ExStreamClient.Jason
  defstruct [:channel_cids, :expiration, :user, :user_id]

  @type t :: %__MODULE__{
          channel_cids: [String.t()] | nil,
          expiration: integer() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end