defmodule ExStreamClient.Model.MuteRequest do
  @moduledoc "Schema representing a MuteRequest"
  use ExStreamClient.Jason
  @enforce_keys [:target_ids]
  defstruct [:timeout, :user, :user_id, :target_ids]

  @type t :: %__MODULE__{
          timeout: integer() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          target_ids: [String.t()]
        }
end