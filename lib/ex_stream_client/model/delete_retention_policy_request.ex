defmodule ExStreamClient.Model.DeleteRetentionPolicyRequest do
  @moduledoc "Schema representing a DeleteRetentionPolicyRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:policy]
  defstruct [:policy]
  @nested_components policy: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{policy: :"inactive-channels" | :"old-messages"}
end
