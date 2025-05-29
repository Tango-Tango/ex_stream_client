defmodule ExStreamClient.Model.CreatePollOptionRequest do
  @moduledoc "Schema representing a CreatePollOptionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:text]
  defstruct [:position, :user, :text, :custom, :user_id]

  @type t :: %__MODULE__{
          position: integer() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          text: String.t(),
          custom: map() | nil,
          user_id: String.t() | nil
        }
end