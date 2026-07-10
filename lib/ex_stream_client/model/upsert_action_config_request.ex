defmodule ExStreamClient.Model.UpsertActionConfigRequest do
  @moduledoc "Schema representing a UpsertActionConfigRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :entity_type, :order]
  defstruct [
    :action,
    :custom,
    :description,
    :entity_type,
    :icon,
    :id,
    :order,
    :queue_type,
    :user,
    :user_id
  ]

  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: String.t(),
          custom: %{optional(String.t()) => any()} | nil,
          description: String.t() | nil,
          entity_type: String.t(),
          icon: String.t() | nil,
          id: String.t() | nil,
          order: integer(),
          queue_type: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
