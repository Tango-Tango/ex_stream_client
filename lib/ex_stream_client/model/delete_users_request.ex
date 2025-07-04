defmodule ExStreamClient.Model.DeleteUsersRequest do
  @moduledoc "Schema representing a DeleteUsersRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:user_ids]
  defstruct [
    :calls,
    :conversations,
    :messages,
    :new_call_owner_id,
    :new_channel_owner_id,
    :user,
    :user_ids
  ]

  @nested_components calls: :enum, conversations: :enum, messages: :enum, user: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          calls: (:hard | :soft) | nil,
          conversations: (:hard | :soft) | nil,
          messages: (:hard | :pruning | :soft) | nil,
          new_call_owner_id: String.t() | nil,
          new_channel_owner_id: String.t() | nil,
          user: (:hard | :pruning | :soft) | nil,
          user_ids: [String.t()]
        }
end
