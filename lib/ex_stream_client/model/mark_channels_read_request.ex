defmodule ExStreamClient.Model.MarkChannelsReadRequest do
  @moduledoc "Schema representing a MarkChannelsReadRequest"
  use ExStreamClient.Jason
  defstruct [:user, :user_id, :read_by_channel]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          read_by_channel: map() | nil
        }
end