defmodule ExStreamClient.Model.DeactivateUsersRequest do
  @moduledoc "Schema representing a DeactivateUsersRequest"
  use ExStreamClient.Jason
  @enforce_keys [:user_ids]
  defstruct [:created_by_id, :mark_channels_deleted, :mark_messages_deleted, :user_ids]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_by_id: String.t() | nil,
          mark_channels_deleted: boolean() | nil,
          mark_messages_deleted: boolean() | nil,
          user_ids: [String.t()]
        }
end
