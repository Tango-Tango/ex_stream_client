defmodule ExStreamClient.Model.DeactivateUserRequest do
  @moduledoc "Schema representing a DeactivateUserRequest"
  use ExStreamClient.Jason
  defstruct [:created_by_id, :mark_messages_deleted]
  @type t :: %__MODULE__{created_by_id: String.t() | nil, mark_messages_deleted: boolean() | nil}
end