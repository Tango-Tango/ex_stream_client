defmodule ExStreamClient.Model.QueryFeedModerationTemplatesResponse do
  @moduledoc "Schema representing a QueryFeedModerationTemplatesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :templates]
  defstruct [:duration, :templates]
  @nested_components templates: ExStreamClient.Model.QueryFeedModerationTemplate
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          templates: [ExStreamClient.Model.QueryFeedModerationTemplate.t()]
        }
end
