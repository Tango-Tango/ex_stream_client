defmodule ExStreamClient.Model.UserUnbannedEvent do
  @moduledoc "Schema representing a UserUnbannedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :shadow, :type]
  defstruct [:type, :user, :shadow, :team, :created_at, :channel_id, :channel_type, :cid]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          shadow: boolean(),
          team: String.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t()
        }
end