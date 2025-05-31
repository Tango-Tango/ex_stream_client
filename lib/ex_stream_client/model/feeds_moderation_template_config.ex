defmodule ExStreamClient.Model.FeedsModerationTemplateConfig do
  @moduledoc "Schema representing a FeedsModerationTemplateConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:config_key, :data_types]
  defstruct [:config_key, :data_types]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{config_key: String.t(), data_types: map()}
end
