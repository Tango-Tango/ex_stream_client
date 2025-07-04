defmodule ExStreamClient.Model.DeviceResponse do
  @moduledoc "Schema representing a DeviceResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :id, :push_provider, :user_id]
  defstruct [
    :created_at,
    :disabled,
    :disabled_reason,
    :id,
    :push_provider,
    :push_provider_name,
    :user_id,
    :voip
  ]

  @nested_components created_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          disabled: boolean() | nil,
          disabled_reason: String.t() | nil,
          id: String.t(),
          push_provider: String.t(),
          push_provider_name: String.t() | nil,
          user_id: String.t(),
          voip: boolean() | nil
        }
end
