defmodule ExStreamClient.Model.UserMuteResponse do
  @moduledoc "Schema representing a UserMuteResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :updated_at]
  defstruct [:user, :target, :created_at, :updated_at, :expires]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserResponse.t() | nil,
          target: ExStreamClient.Model.UserResponse.t() | nil,
          created_at: float(),
          updated_at: float(),
          expires: float() | nil
        }
end