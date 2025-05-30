defmodule ExStreamClient.Model.SearchResult do
  @moduledoc "Schema representing a SearchResult"
  use ExStreamClient.Jason
  defstruct [:message]
  @nested_components message: ExStreamClient.Model.SearchResultMessage
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{message: ExStreamClient.Model.SearchResultMessage.t() | nil}
end
