defmodule ExStreamClient.Model.ModerationResponse do
  @moduledoc "Schema representing a ModerationResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action, :automod_response, :explicit, :spam, :toxic]
  defstruct [:action, :automod_response, :explicit, :spam, :toxic]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: String.t(),
          automod_response: any(),
          explicit: float(),
          spam: float(),
          toxic: float()
        }
end
