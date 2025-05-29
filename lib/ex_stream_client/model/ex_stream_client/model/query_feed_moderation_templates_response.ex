defmodule ExStreamClient.Model.QueryFeedModerationTemplatesResponse do
  @moduledoc "Schema representing a QueryFeedModerationTemplatesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :templates]
  defstruct [:duration, :templates]

  @type t :: %__MODULE__{
          duration: String.t(),
          templates: [ExStreamClient.Model.QueryFeedModerationTemplate.t()]
        }
end