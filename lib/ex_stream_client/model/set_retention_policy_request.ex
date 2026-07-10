defmodule ExStreamClient.Model.SetRetentionPolicyRequest do
  @moduledoc "Schema representing a SetRetentionPolicyRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:max_age_hours, :policy]
  defstruct [:max_age_hours, :policy]
  @nested_components policy: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{max_age_hours: integer(), policy: :"inactive-channels" | :"old-messages"}
end
