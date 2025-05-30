defmodule ExStreamClient.Model.CustomActionRequest do
  @moduledoc "Schema representing a CustomActionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:id, :options]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{id: String.t() | nil, options: %{optional(String.t()) => any()} | nil}
end
