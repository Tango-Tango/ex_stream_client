defmodule ExStreamClient.Model.ReactivateUserResponse do
  @moduledoc "Schema representing a ReactivateUserResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:user, :duration]
  @type t :: %__MODULE__{user: ExStreamClient.Model.UserResponse.t() | nil, duration: String.t()}
end