defmodule ExStreamClient.Model.UserReactivatedEvent do
  @moduledoc "Schema representing a UserReactivatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:created_at, :type, :user]

  @type t :: %__MODULE__{
          created_at: float(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end