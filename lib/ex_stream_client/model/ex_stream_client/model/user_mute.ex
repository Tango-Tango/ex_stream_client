defmodule ExStreamClient.Model.UserMute do
  @moduledoc "Schema representing a UserMute"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :updated_at]
  defstruct [:user, :target, :created_at, :updated_at, :expires]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.User.t() | nil,
          target: ExStreamClient.Model.User.t() | nil,
          created_at: float(),
          updated_at: float(),
          expires: float() | nil
        }
end