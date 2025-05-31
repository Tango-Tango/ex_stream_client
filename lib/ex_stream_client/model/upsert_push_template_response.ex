defmodule ExStreamClient.Model.UpsertPushTemplateResponse do
  @moduledoc "Schema representing a UpsertPushTemplateResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :template]
  @nested_components template: ExStreamClient.Model.PushTemplate
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          template: ExStreamClient.Model.PushTemplate.t() | nil
        }
end
