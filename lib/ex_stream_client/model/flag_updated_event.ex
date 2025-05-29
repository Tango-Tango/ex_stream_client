defmodule ExStreamClient.Model.FlagUpdatedEvent do
  @moduledoc "Schema representing a FlagUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:message, :type, :user, :custom, :created_at, :created_by, :received_at]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil,
          custom: map(),
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          received_at: float() | nil
        }
end