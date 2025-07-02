defmodule ExStreamClient.Model.QueryFeedModerationTemplate do
  @moduledoc "Schema representing a QueryFeedModerationTemplate"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :name, :updated_at]
  defstruct [:config, :created_at, :name, :updated_at]

  @nested_components config: ExStreamClient.Model.FeedsModerationTemplateConfig,
                     created_at: :datetime,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          config: ExStreamClient.Model.FeedsModerationTemplateConfig.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          name: String.t(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
