defmodule ExStreamClient.Model.QueryPollsResponse do
  @moduledoc "Schema representing a QueryPollsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :polls]
  defstruct [:duration, :next, :polls, :prev]
  @nested_components polls: ExStreamClient.Model.PollResponseData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          polls: [ExStreamClient.Model.PollResponseData.t()],
          prev: String.t() | nil
        }
end
