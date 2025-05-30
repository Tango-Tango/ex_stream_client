defmodule ExStreamClient.Model.MessageFlaggedEvent do
  @moduledoc "Schema representing a MessageFlaggedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:cid, :created_at, :type]
  defstruct [:cid, :created_at, :flag, :message, :thread_participants, :type, :user]

  @nested_components %{
    message: ExStreamClient.Model.Message,
    user: ExStreamClient.Model.User,
    flag: ExStreamClient.Model.Flag,
    thread_participants: ExStreamClient.Model.User
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          cid: String.t(),
          created_at: float(),
          flag: ExStreamClient.Model.Flag.t() | nil,
          message: ExStreamClient.Model.Message.t() | nil,
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
