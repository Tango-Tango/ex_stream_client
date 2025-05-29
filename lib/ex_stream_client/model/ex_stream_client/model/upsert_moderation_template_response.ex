defmodule ExStreamClient.Model.UpsertModerationTemplateResponse do
  @moduledoc "Schema representing a UpsertModerationTemplateResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :duration, :name, :updated_at]
  defstruct [:name, :config, :duration, :created_at, :updated_at]

  @type t :: %__MODULE__{
          name: String.t(),
          config: ExStreamClient.Model.FeedsModerationTemplateConfig.t() | nil,
          duration: String.t(),
          created_at: float(),
          updated_at: float()
        }
end