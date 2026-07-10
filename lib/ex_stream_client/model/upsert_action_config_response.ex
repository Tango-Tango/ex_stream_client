defmodule ExStreamClient.Model.UpsertActionConfigResponse do
  @moduledoc "Schema representing a UpsertActionConfigResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:action_config, :duration]
  @nested_components action_config: ExStreamClient.Model.ModerationActionConfigResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_config: ExStreamClient.Model.ModerationActionConfigResponse.t() | nil,
          duration: String.t()
        }
end
