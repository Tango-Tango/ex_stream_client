defmodule ExStreamClient.Model.SetRetentionPolicyResponse do
  @moduledoc "Schema representing a SetRetentionPolicyResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :policy]
  defstruct [:duration, :policy]
  @nested_components policy: ExStreamClient.Model.RetentionPolicy
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), policy: ExStreamClient.Model.RetentionPolicy.t()}
end
