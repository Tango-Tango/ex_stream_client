defmodule ExStreamClient.Model.QueryFeedModerationTemplate do
  @moduledoc "Schema representing a QueryFeedModerationTemplate"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :name, :updated_at]
  defstruct [:name, :config, :created_at, :updated_at]

  @type t :: %__MODULE__{
          name: String.t(),
          config: ExStreamClient.Model.FeedsModerationTemplateConfig.t() | nil,
          created_at: float(),
          updated_at: float()
        }
end