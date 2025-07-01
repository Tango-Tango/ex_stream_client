defmodule ExStreamClient.Model.VideoCallRuleConfig do
  @moduledoc "Schema representing a VideoCallRuleConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:rules]
  defstruct [:rules]
  @nested_components rules: {:map, ExStreamClient.Model.HarmConfig}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{rules: %{optional(String.t()) => ExStreamClient.Model.HarmConfig.t()}}
end
