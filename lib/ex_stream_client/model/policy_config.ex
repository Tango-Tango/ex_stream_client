defmodule ExStreamClient.Model.PolicyConfig do
  @moduledoc "Schema representing a PolicyConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:max_age_hours]
  defstruct [:max_age_hours]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{max_age_hours: integer()}
end
