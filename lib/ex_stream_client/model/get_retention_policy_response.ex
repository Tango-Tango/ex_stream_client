defmodule ExStreamClient.Model.GetRetentionPolicyResponse do
  @moduledoc "Schema representing a GetRetentionPolicyResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :policies]
  defstruct [:duration, :policies]
  @nested_components policies: ExStreamClient.Model.RetentionPolicy
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          policies: [ExStreamClient.Model.RetentionPolicy.t()]
        }
end
