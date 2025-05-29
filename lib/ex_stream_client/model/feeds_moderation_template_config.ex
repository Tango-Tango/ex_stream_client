defmodule ExStreamClient.Model.FeedsModerationTemplateConfig do
  @moduledoc "Schema representing a FeedsModerationTemplateConfig"
  use ExStreamClient.Jason
  @enforce_keys [:config_key, :data_types]
  defstruct [:config_key, :data_types]
  @type t :: %__MODULE__{config_key: String.t(), data_types: map()}
end