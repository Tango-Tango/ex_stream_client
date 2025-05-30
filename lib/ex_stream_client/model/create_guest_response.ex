defmodule ExStreamClient.Model.CreateGuestResponse do
  @moduledoc "Schema representing a CreateGuestResponse"
  use ExStreamClient.Jason
  @enforce_keys [:access_token, :duration, :user]
  defstruct [:access_token, :duration, :user]
  @nested_components user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          access_token: String.t(),
          duration: String.t(),
          user: ExStreamClient.Model.UserResponse.t()
        }
end
