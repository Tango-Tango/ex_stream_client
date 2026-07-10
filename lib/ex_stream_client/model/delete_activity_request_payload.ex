defmodule ExStreamClient.Model.DeleteActivityRequestPayload do
  @moduledoc "Schema representing a DeleteActivityRequestPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:entity_id, :entity_type, :hard_delete, :reason]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          entity_id: String.t() | nil,
          entity_type: String.t() | nil,
          hard_delete: boolean() | nil,
          reason: String.t() | nil
        }
end
