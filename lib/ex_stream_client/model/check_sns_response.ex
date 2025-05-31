defmodule ExStreamClient.Model.CheckSNSResponse do
  @moduledoc "Schema representing a CheckSNSResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :status]
  defstruct [:data, :duration, :error, :status]
  @nested_components status: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          data: %{optional(String.t()) => any()} | nil,
          duration: String.t(),
          error: String.t() | nil,
          status: :error | :ok
        }
end
