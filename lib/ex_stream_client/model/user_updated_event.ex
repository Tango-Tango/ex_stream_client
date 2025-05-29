defmodule ExStreamClient.Model.UserUpdatedEvent do
  @moduledoc "Schema representing a UserUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type, :user]
  defstruct [:created_at, :custom, :received_at, :type, :user]

  @type t :: %__MODULE__{
          created_at: float(),
          custom: map(),
          received_at: float() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponsePrivacyFields.t()
        }
end