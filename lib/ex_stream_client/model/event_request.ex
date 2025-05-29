defmodule ExStreamClient.Model.EventRequest do
  @moduledoc "Schema representing a EventRequest"
  use ExStreamClient.Jason
  @enforce_keys [:type]
  defstruct [:type, :user, :custom, :user_id, :parent_id]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          custom: map() | nil,
          user_id: String.t() | nil,
          parent_id: String.t() | nil
        }
end