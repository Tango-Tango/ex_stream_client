defmodule ExStreamClient.Model.User do
  @moduledoc "Schema representing a User"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:id]
  defstruct [:channel_last_read_at, :channel_unread_count, :data, :id, :unread_thread_messages]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_last_read_at: String.t() | nil,
          channel_unread_count: integer() | nil,
          data: %{optional(String.t()) => any()} | nil,
          id: String.t(),
          unread_thread_messages: integer() | nil
        }
end
