defmodule ExStreamClient.Model.GetRetentionPolicyRunsResponse do
  @moduledoc "Schema representing a GetRetentionPolicyRunsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :runs]
  defstruct [:duration, :next, :prev, :runs]
  @nested_components runs: ExStreamClient.Model.RetentionRunResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil,
          runs: [ExStreamClient.Model.RetentionRunResponse.t()]
        }
end
