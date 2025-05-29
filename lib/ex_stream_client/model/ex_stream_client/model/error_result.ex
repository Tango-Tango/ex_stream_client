defmodule ExStreamClient.Model.ErrorResult do
  @moduledoc "Schema representing a ErrorResult"
  use ExStreamClient.Jason
  @enforce_keys [:type]
  defstruct [:type, :version, :stacktrace]

  @type t :: %__MODULE__{
          type: String.t(),
          version: String.t() | nil,
          stacktrace: String.t() | nil
        }
end