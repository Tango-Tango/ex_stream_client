defmodule ExStreamClient.Model.ReactivateUsersRequest do
  @moduledoc "Schema representing a ReactivateUsersRequest"
  use ExStreamClient.Jason
  @enforce_keys [:user_ids]
  defstruct [:created_by_id, :user_ids, :restore_channels, :restore_messages]

  @type t :: %__MODULE__{
          created_by_id: String.t() | nil,
          user_ids: [String.t()],
          restore_channels: boolean() | nil,
          restore_messages: boolean() | nil
        }
end