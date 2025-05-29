defmodule ExStreamClient.Model.UserUpdatedEvent do
  @moduledoc "Schema representing a UserUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type, :user]
  defstruct [:type, :user, :custom, :created_at, :received_at]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.UserResponsePrivacyFields.t(),
          custom: map(),
          created_at: float(),
          received_at: float() | nil
        }
end