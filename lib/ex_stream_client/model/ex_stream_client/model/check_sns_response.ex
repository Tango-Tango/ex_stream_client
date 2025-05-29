defmodule ExStreamClient.Model.CheckSNSResponse do
  @moduledoc "Schema representing a CheckSNSResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :status]
  defstruct [:error, :data, :status, :duration]

  @type t :: %__MODULE__{
          error: String.t() | nil,
          data: map() | nil,
          status: :error | :ok,
          duration: String.t()
        }
end