defmodule ExStreamClient.Model.UpdateBlockListRequest do
  @moduledoc "Schema representing a UpdateBlockListRequest"
  use ExStreamClient.Jason
  defstruct [:team, :words]
  @type t :: %__MODULE__{team: String.t() | nil, words: [String.t()] | nil}
end