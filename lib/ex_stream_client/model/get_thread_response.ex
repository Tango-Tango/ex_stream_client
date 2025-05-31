defmodule ExStreamClient.Model.GetThreadResponse do
  @moduledoc "Schema representing a GetThreadResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :thread]
  defstruct [:duration, :thread]
  @nested_components thread: ExStreamClient.Model.ThreadStateResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          thread: ExStreamClient.Model.ThreadStateResponse.t()
        }
end
