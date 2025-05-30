defmodule ExStreamClient.Model.QueryFeedModerationTemplate do
  @moduledoc "Schema representing a QueryFeedModerationTemplate"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :name, :updated_at]
  defstruct [:config, :created_at, :name, :updated_at]
  @nested_components config: ExStreamClient.Model.FeedsModerationTemplateConfig
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          config: ExStreamClient.Model.FeedsModerationTemplateConfig.t() | nil,
          created_at: float(),
          name: String.t(),
          updated_at: float()
        }
end
