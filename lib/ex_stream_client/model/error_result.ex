defmodule ExStreamClient.Model.ErrorResult do
  @moduledoc "Schema representing a ErrorResult"
  use ExStreamClient.Jason
  @enforce_keys [:type]
  defstruct [:stacktrace, :type, :version]

  @type t :: %__MODULE__{
          stacktrace: String.t() | nil,
          type: String.t(),
          version: String.t() | nil
        }
end