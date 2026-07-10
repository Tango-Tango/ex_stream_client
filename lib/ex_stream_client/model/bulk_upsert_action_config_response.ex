defmodule ExStreamClient.Model.BulkUpsertActionConfigResponse do
  @moduledoc "Schema representing a BulkUpsertActionConfigResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action_configs, :duration]
  defstruct [:action_configs, :duration]
  @nested_components action_configs: ExStreamClient.Model.ModerationActionConfigResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_configs: [ExStreamClient.Model.ModerationActionConfigResponse.t()],
          duration: String.t()
        }
end
