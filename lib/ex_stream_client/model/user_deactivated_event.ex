defmodule ExStreamClient.Model.UserDeactivatedEvent do
  @moduledoc "Schema representing a UserDeactivatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :created_by, :type]
  defstruct [:type, :user, :created_at, :created_by]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.User.t()
        }
end