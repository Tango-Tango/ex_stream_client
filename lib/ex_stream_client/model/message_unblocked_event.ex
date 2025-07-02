defmodule ExStreamClient.Model.MessageUnblockedEvent do
  @moduledoc "Schema representing a MessageUnblockedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:cid, :created_at, :type]
  defstruct [:cid, :created_at, :message, :thread_participants, :type, :user]

  @nested_components created_at: :datetime,
                     message: ExStreamClient.Model.Message,
                     thread_participants: ExStreamClient.Model.User,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          message: ExStreamClient.Model.Message.t() | nil,
          thread_participants: [ExStreamClient.Model.User.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
