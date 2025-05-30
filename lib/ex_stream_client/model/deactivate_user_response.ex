defmodule ExStreamClient.Model.DeactivateUserResponse do
  @moduledoc "Schema representing a DeactivateUserResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :user]
  @nested_components user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), user: ExStreamClient.Model.UserResponse.t() | nil}
end
