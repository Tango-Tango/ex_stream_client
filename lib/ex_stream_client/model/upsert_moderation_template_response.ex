defmodule ExStreamClient.Model.UpsertModerationTemplateResponse do
  @moduledoc "Schema representing a UpsertModerationTemplateResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :duration, :name, :updated_at]
  defstruct [:config, :created_at, :duration, :name, :updated_at]

  @type t :: %__MODULE__{
          config: ExStreamClient.Model.FeedsModerationTemplateConfig.t() | nil,
          created_at: float(),
          duration: String.t(),
          name: String.t(),
          updated_at: float()
        }
end