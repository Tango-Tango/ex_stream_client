defmodule ExStreamClient.Model.CreateGuestRequest do
  @moduledoc "Schema representing a CreateGuestRequest"
  use ExStreamClient.Jason
  @enforce_keys [:user]
  defstruct [:user]
  @type t :: %__MODULE__{user: ExStreamClient.Model.UserRequest.t()}
end