defmodule ExStreamClient.Model.SearchResult do
  @moduledoc "Schema representing a SearchResult"
  use ExStreamClient.Jason
  defstruct [:message]
  @type t :: %__MODULE__{message: ExStreamClient.Model.SearchResultMessage.t() | nil}
end