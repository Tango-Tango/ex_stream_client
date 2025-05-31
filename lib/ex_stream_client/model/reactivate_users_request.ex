defmodule ExStreamClient.Model.ReactivateUsersRequest do
  @moduledoc "Schema representing a ReactivateUsersRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:user_ids]
  defstruct [:created_by_id, :restore_channels, :restore_messages, :user_ids]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_by_id: String.t() | nil,
          restore_channels: boolean() | nil,
          restore_messages: boolean() | nil,
          user_ids: [String.t()]
        }
end
