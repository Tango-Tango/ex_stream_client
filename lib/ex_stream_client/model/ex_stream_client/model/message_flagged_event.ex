defmodule ExStreamClient.Model.MessageFlaggedEvent do
  @moduledoc "Schema representing a MessageFlaggedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:cid, :created_at, :type]
  defstruct [:message, :type, :user, :flag, :created_at, :cid, :thread_participants]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.Message.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          flag: ExStreamClient.Model.Flag.t() | nil,
          created_at: float(),
          cid: String.t(),
          thread_participants: [ExStreamClient.Model.User.t()] | nil
        }
end