defmodule ExStreamClient.Model.UnmuteRequest do
  @moduledoc "Schema representing a UnmuteRequest"
  use ExStreamClient.Jason
  @enforce_keys [:target_ids]
  defstruct [:user, :user_id, :target_ids]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          target_ids: [String.t()]
        }
end