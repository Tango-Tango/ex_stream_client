defmodule ExStreamClient.Model.PollOptionRequest do
  @moduledoc "Schema representing a PollOptionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:id]
  defstruct [:custom, :id, :text]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: %{optional(String.t()) => any()} | nil,
          id: String.t(),
          text: String.t() | nil
        }
end
