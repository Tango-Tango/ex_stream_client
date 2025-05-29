defmodule ExStreamClient.Model.CreateGuestResponse do
  @moduledoc "Schema representing a CreateGuestResponse"
  use ExStreamClient.Jason
  @enforce_keys [:access_token, :duration, :user]
  defstruct [:user, :duration, :access_token]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserResponse.t(),
          duration: String.t(),
          access_token: String.t()
        }
end