defmodule ExStreamClient.Model.CheckSQSResponse do
  @moduledoc "Schema representing a CheckSQSResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :status]
  defstruct [:data, :duration, :error, :status]

  @type t :: %__MODULE__{
          data: map() | nil,
          duration: String.t(),
          error: String.t() | nil,
          status: :error | :ok
        }
end