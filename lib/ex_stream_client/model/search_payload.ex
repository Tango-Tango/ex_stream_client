defmodule ExStreamClient.Model.SearchPayload do
  @moduledoc "Schema representing a SearchPayload"
  use ExStreamClient.Jason
  @enforce_keys [:filter_conditions]
  defstruct [
    :filter_conditions,
    :limit,
    :message_filter_conditions,
    :message_options,
    :next,
    :offset,
    :query,
    :sort
  ]

  @type t :: %__MODULE__{
          filter_conditions: map(),
          limit: integer() | nil,
          message_filter_conditions: map() | nil,
          message_options: ExStreamClient.Model.MessageOptions.t() | nil,
          next: String.t() | nil,
          offset: integer() | nil,
          query: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil
        }
end