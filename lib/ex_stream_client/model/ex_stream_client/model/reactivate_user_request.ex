defmodule ExStreamClient.Model.ReactivateUserRequest do
  @moduledoc "Schema representing a ReactivateUserRequest"
  use ExStreamClient.Jason
  defstruct [:name, :created_by_id, :restore_messages]

  @type t :: %__MODULE__{
          name: String.t() | nil,
          created_by_id: String.t() | nil,
          restore_messages: boolean() | nil
        }
end