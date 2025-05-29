defmodule ExStreamClient.Model.Field do
  @moduledoc "Schema representing a Field"
  use ExStreamClient.Jason
  @enforce_keys [:short, :title, :value]
  defstruct [:short, :value, :title]
  @type t :: %__MODULE__{short: boolean(), value: String.t(), title: String.t()}
end