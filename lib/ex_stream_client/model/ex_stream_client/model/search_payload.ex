defmodule ExStreamClient.Model.SearchPayload do
  @moduledoc "Schema representing a SearchPayload"
  use ExStreamClient.Jason
  @enforce_keys [:filter_conditions]
  defstruct [
    :offset,
    :next,
    :sort,
    :limit,
    :query,
    :filter_conditions,
    :message_filter_conditions,
    :message_options
  ]

  @type t :: %__MODULE__{
          offset: integer() | nil,
          next: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil,
          limit: integer() | nil,
          query: String.t() | nil,
          filter_conditions: map(),
          message_filter_conditions: map() | nil,
          message_options: ExStreamClient.Model.MessageOptions.t() | nil
        }
end