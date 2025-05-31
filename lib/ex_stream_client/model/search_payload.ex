defmodule ExStreamClient.Model.SearchPayload do
  @moduledoc "Schema representing a SearchPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
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

  @nested_components message_options: ExStreamClient.Model.MessageOptions,
                     sort: ExStreamClient.Model.SortParamRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          filter_conditions: %{optional(String.t()) => any()},
          limit: integer() | nil,
          message_filter_conditions: %{optional(String.t()) => any()} | nil,
          message_options: ExStreamClient.Model.MessageOptions.t() | nil,
          next: String.t() | nil,
          offset: integer() | nil,
          query: String.t() | nil,
          sort: [ExStreamClient.Model.SortParamRequest.t()] | nil
        }
end
