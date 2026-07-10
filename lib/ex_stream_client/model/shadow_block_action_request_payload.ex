defmodule ExStreamClient.Model.ShadowBlockActionRequestPayload do
  @moduledoc "Schema representing a ShadowBlockActionRequestPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:reason]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{reason: String.t() | nil}
end
