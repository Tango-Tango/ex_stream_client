defmodule ExStreamClient.Model.DeleteChannelsResultResponse do
  @moduledoc "Schema representing a DeleteChannelsResultResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:status]
  defstruct [:error, :status]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{error: String.t() | nil, status: String.t()}
end
