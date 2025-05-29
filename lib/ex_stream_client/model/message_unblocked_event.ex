defmodule ExStreamClient.Model.MessageUnblockedEvent do
  @moduledoc "Schema representing a MessageUnblockedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:cid, :created_at, :type]
  defstruct [:cid, :created_at, :message, :thread_participants, :type, :user]

  @type t :: %__MODULE__{
          cid: String.t(),
          created_at: float(),
          message: ExStreamClient.Model.Message.t() | nil,
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end