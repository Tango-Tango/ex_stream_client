defmodule ExStreamClient.Model.FilterConfigResponse do
  @moduledoc "Schema representing a FilterConfigResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:llm_labels]
  defstruct [:ai_text_labels, :config_keys, :llm_labels]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ai_text_labels: [String.t()] | nil,
          config_keys: [String.t()] | nil,
          llm_labels: [String.t()]
        }
end
