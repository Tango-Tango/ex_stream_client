defmodule ExStreamClient.Model.InsertActionLogRequest do
  @moduledoc "Schema representing a InsertActionLogRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action_type, :entity_creator_id, :entity_id, :entity_type]
  defstruct [
    :action_type,
    :custom,
    :entity_creator_id,
    :entity_id,
    :entity_type,
    :reason,
    :reporter_type,
    :reporter_user_id
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_type: String.t(),
          custom: %{optional(String.t()) => any()} | nil,
          entity_creator_id: String.t(),
          entity_id: String.t(),
          entity_type: String.t(),
          reason: String.t() | nil,
          reporter_type: String.t() | nil,
          reporter_user_id: String.t() | nil
        }
end
