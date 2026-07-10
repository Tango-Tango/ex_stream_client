defmodule ExStreamClient.Model.VideoCallRuleConfig do
  @moduledoc "Schema representing a VideoCallRuleConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:flag_all_labels, :flagged_labels, :rules]
  @nested_components rules: ExStreamClient.Model.HarmConfig
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          flag_all_labels: boolean() | nil,
          flagged_labels: [String.t()] | nil,
          rules: [ExStreamClient.Model.HarmConfig.t()] | nil
        }
end
