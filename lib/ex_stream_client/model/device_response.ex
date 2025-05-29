defmodule ExStreamClient.Model.DeviceResponse do
  @moduledoc "Schema representing a DeviceResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :id, :push_provider, :user_id]
  defstruct [
    :disabled,
    :id,
    :created_at,
    :user_id,
    :push_provider,
    :disabled_reason,
    :push_provider_name,
    :voip
  ]

  @type t :: %__MODULE__{
          disabled: boolean() | nil,
          id: String.t(),
          created_at: float(),
          user_id: String.t(),
          push_provider: String.t(),
          disabled_reason: String.t() | nil,
          push_provider_name: String.t() | nil,
          voip: boolean() | nil
        }
end