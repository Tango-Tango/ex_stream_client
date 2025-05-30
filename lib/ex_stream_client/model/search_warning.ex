defmodule ExStreamClient.Model.SearchWarning do
  @moduledoc "Schema representing a SearchWarning"
  use ExStreamClient.Jason
  @enforce_keys [:warning_code, :warning_description]
  defstruct [:channel_search_cids, :channel_search_count, :warning_code, :warning_description]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_search_cids: [String.t()] | nil,
          channel_search_count: integer() | nil,
          warning_code: integer(),
          warning_description: String.t()
        }
end
