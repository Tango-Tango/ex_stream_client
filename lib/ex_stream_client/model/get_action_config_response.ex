defmodule ExStreamClient.Model.GetActionConfigResponse do
  @moduledoc "Schema representing a GetActionConfigResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action_config, :duration]
  defstruct [:action_config, :duration]

  @nested_components action_config:
                       {:map, {:array, ExStreamClient.Model.ModerationActionConfigResponse}}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_config: %{
            optional(String.t()) => [ExStreamClient.Model.ModerationActionConfigResponse.t()]
          },
          duration: String.t()
        }
end
