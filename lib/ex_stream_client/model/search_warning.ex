defmodule ExStreamClient.Model.SearchWarning do
  @moduledoc "Schema representing a SearchWarning"
  use ExStreamClient.Jason
  @enforce_keys [:warning_code, :warning_description]
  defstruct [:warning_code, :warning_description, :channel_search_cids, :channel_search_count]

  @type t :: %__MODULE__{
          warning_code: integer(),
          warning_description: String.t(),
          channel_search_cids: [String.t()] | nil,
          channel_search_count: integer() | nil
        }
end