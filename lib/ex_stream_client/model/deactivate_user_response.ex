defmodule ExStreamClient.Model.DeactivateUserResponse do
  @moduledoc "Schema representing a DeactivateUserResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:user, :duration]
  @type t :: %__MODULE__{user: ExStreamClient.Model.UserResponse.t() | nil, duration: String.t()}
end