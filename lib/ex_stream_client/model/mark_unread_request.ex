defmodule ExStreamClient.Model.MarkUnreadRequest do
  @moduledoc "Schema representing a MarkUnreadRequest"
  use ExStreamClient.Jason
  defstruct [:message_id, :thread_id, :user, :user_id]

  @type t :: %__MODULE__{
          message_id: String.t() | nil,
          thread_id: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end