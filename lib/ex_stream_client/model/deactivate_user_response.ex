defmodule ExStreamClient.Model.DeactivateUserResponse do
  @moduledoc "Schema representing a DeactivateUserResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :user]
  @type t :: %__MODULE__{duration: String.t(), user: ExStreamClient.Model.UserResponse.t() | nil}
end