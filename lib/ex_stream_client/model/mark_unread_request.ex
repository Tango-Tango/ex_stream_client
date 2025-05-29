defmodule ExStreamClient.Model.MarkUnreadRequest do
  @moduledoc "Schema representing a MarkUnreadRequest"
  use ExStreamClient.Jason
  defstruct [:user, :user_id, :message_id, :thread_id]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          message_id: String.t() | nil,
          thread_id: String.t() | nil
        }
end