defmodule ExStreamClient.Model.DeleteUsersRequest do
  @moduledoc "Schema representing a DeleteUsersRequest"
  use ExStreamClient.Jason
  @enforce_keys [:user_ids]
  defstruct [
    :messages,
    :user,
    :user_ids,
    :calls,
    :conversations,
    :new_call_owner_id,
    :new_channel_owner_id
  ]

  @type t :: %__MODULE__{
          messages: (:hard | :pruning | :soft) | nil,
          user: (:hard | :pruning | :soft) | nil,
          user_ids: [String.t()],
          calls: (:hard | :soft) | nil,
          conversations: (:hard | :soft) | nil,
          new_call_owner_id: String.t() | nil,
          new_channel_owner_id: String.t() | nil
        }
end