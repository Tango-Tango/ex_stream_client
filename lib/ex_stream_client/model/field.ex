defmodule ExStreamClient.Model.Field do
  @moduledoc "Schema representing a Field"
  use ExStreamClient.Jason
  @enforce_keys [:short, :title, :value]
  defstruct [:short, :title, :value]
  @type t :: %__MODULE__{short: boolean(), title: String.t(), value: String.t()}
end