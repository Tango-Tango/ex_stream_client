defmodule ExStreamClient.Model.UserReactivatedEvent do
  @moduledoc "Schema representing a UserReactivatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:type, :user, :created_at]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          created_at: float()
        }
end