defmodule ExStreamClient.Model.QueryAppealsResponse do
  @moduledoc "Schema representing a QueryAppealsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :items]
  defstruct [:duration, :items, :next, :prev]
  @nested_components items: ExStreamClient.Model.AppealItemResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          items: [ExStreamClient.Model.AppealItemResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil
        }
end
