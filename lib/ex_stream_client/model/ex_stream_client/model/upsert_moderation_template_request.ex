defmodule ExStreamClient.Model.UpsertModerationTemplateRequest do
  @moduledoc "Schema representing a UpsertModerationTemplateRequest"
  use ExStreamClient.Jason
  @enforce_keys [:config, :name]
  defstruct [:name, :config]

  @type t :: %__MODULE__{
          name: String.t(),
          config: ExStreamClient.Model.FeedsModerationTemplateConfig.t()
        }
end