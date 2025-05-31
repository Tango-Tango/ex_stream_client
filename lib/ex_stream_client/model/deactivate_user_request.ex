defmodule ExStreamClient.Model.DeactivateUserRequest do
  @moduledoc "Schema representing a DeactivateUserRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:created_by_id, :mark_messages_deleted]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{created_by_id: String.t() | nil, mark_messages_deleted: boolean() | nil}
end
