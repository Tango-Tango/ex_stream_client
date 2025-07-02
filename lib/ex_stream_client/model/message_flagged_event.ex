defmodule ExStreamClient.Model.MessageFlaggedEvent do
  @moduledoc "Schema representing a MessageFlaggedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:cid, :created_at, :type]
  defstruct [:cid, :created_at, :flag, :message, :thread_participants, :type, :user]

  @nested_components created_at: :datetime,
                     flag: ExStreamClient.Model.Flag,
                     message: ExStreamClient.Model.Message,
                     thread_participants: ExStreamClient.Model.User,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          flag: ExStreamClient.Model.Flag.t() | nil,
          message: ExStreamClient.Model.Message.t() | nil,
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
