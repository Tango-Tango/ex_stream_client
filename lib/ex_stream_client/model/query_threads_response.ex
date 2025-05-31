defmodule ExStreamClient.Model.QueryThreadsResponse do
  @moduledoc "Schema representing a QueryThreadsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :threads]
  defstruct [:duration, :next, :prev, :threads]
  @nested_components threads: ExStreamClient.Model.ThreadStateResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil,
          threads: [ExStreamClient.Model.ThreadStateResponse.t()]
        }
end
