defmodule ExStreamClient.Model.RuleBuilderAction do
  @moduledoc "Schema representing a RuleBuilderAction"
  use ExStreamClient.Jason
  defstruct [:duration, :ip_ban, :reason, :shadow_ban, :type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: integer() | nil,
          ip_ban: boolean() | nil,
          reason: String.t() | nil,
          shadow_ban: boolean() | nil,
          type: String.t() | nil
        }
end
