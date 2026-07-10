defmodule ExStreamClient.Model.GetFlagCountRequest do
  @moduledoc "Schema representing a GetFlagCountRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:entity_creator_id]
  defstruct [:entity_creator_id, :entity_type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{entity_creator_id: String.t(), entity_type: String.t() | nil}
end
