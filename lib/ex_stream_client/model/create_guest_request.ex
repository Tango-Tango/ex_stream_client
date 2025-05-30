defmodule ExStreamClient.Model.CreateGuestRequest do
  @moduledoc "Schema representing a CreateGuestRequest"
  use ExStreamClient.Jason
  @enforce_keys [:user]
  defstruct [:user]
  @nested_components %{user: ExStreamClient.Model.UserRequest}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{user: ExStreamClient.Model.UserRequest.t()}
end
