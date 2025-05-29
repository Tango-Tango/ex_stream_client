defmodule ExStreamClient.Model.UpsertModerationTemplateRequest do
  @moduledoc "Schema representing a UpsertModerationTemplateRequest"
  use ExStreamClient.Jason
  @enforce_keys [:config, :name]
  defstruct [:config, :name]

  @type t :: %__MODULE__{
          config: ExStreamClient.Model.FeedsModerationTemplateConfig.t(),
          name: String.t()
        }
end