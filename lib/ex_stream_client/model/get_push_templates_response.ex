defmodule ExStreamClient.Model.GetPushTemplatesResponse do
  @moduledoc "Schema representing a GetPushTemplatesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :templates]
  defstruct [:duration, :templates]
  @nested_components templates: ExStreamClient.Model.PushTemplate
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), templates: [ExStreamClient.Model.PushTemplate.t()]}
end
