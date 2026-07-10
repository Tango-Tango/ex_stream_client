defmodule ExStreamClient.Model.UpsertModerationTemplateRequest do
  @moduledoc "Schema representing a UpsertModerationTemplateRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:config, :name]
  defstruct [:config, :name]
  @nested_components config: ExStreamClient.Model.FeedsModerationTemplateConfigPayload
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          config: ExStreamClient.Model.FeedsModerationTemplateConfigPayload.t(),
          name: String.t()
        }
end
