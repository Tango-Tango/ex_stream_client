defmodule ExStreamClient.Model.UpdateBlockListRequest do
  @moduledoc "Schema representing a UpdateBlockListRequest"
  use ExStreamClient.Jason
  defstruct [:words, :team]
  @type t :: %__MODULE__{words: [String.t()] | nil, team: String.t() | nil}
end