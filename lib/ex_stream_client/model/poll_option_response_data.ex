defmodule ExStreamClient.Model.PollOptionResponseData do
  @moduledoc "Schema representing a PollOptionResponseData"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:custom, :id, :text]
  defstruct [:custom, :id, :text]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: %{optional(String.t()) => any()},
          id: String.t(),
          text: String.t()
        }
end
