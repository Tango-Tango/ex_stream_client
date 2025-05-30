defmodule ExStreamClient.Model.ModerationResponse do
  @moduledoc "Schema representing a ModerationResponse"
  use ExStreamClient.Jason
  @enforce_keys [:action, :explicit, :spam, :toxic]
  defstruct [:action, :explicit, :spam, :toxic]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{action: String.t(), explicit: float(), spam: float(), toxic: float()}
end
