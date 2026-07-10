defmodule ExStreamClient.Model.FeedsModerationTemplateConfigPayload do
  @moduledoc "Schema representing a FeedsModerationTemplateConfigPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:data_types]
  defstruct [:config_key, :data_types]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          config_key: String.t() | nil,
          data_types: %{optional(String.t()) => String.t()}
        }
end
