defmodule ExStreamClient.Model.ChannelVisibleEvent do
  @moduledoc "Schema representing a ChannelVisibleEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type]
  defstruct [:type, :user, :created_at, :channel_id, :channel_type, :cid]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t()
        }
end