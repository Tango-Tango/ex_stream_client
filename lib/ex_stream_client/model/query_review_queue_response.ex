defmodule ExStreamClient.Model.QueryReviewQueueResponse do
  @moduledoc "Schema representing a QueryReviewQueueResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action_config, :duration, :items, :stats]
  defstruct [
    :action_config,
    :default_action_config,
    :duration,
    :filter_config,
    :items,
    :next,
    :prev,
    :stats
  ]

  @nested_components action_config:
                       {:map, {:array, ExStreamClient.Model.ModerationActionConfigResponse}},
                     default_action_config:
                       {:map, {:array, ExStreamClient.Model.ModerationActionConfigResponse}},
                     filter_config: ExStreamClient.Model.FilterConfigResponse,
                     items: ExStreamClient.Model.ReviewQueueItemResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_config: %{
            optional(String.t()) => [ExStreamClient.Model.ModerationActionConfigResponse.t()]
          },
          default_action_config:
            %{optional(String.t()) => [ExStreamClient.Model.ModerationActionConfigResponse.t()]}
            | nil,
          duration: String.t(),
          filter_config: ExStreamClient.Model.FilterConfigResponse.t() | nil,
          items: [ExStreamClient.Model.ReviewQueueItemResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil,
          stats: %{optional(String.t()) => any()}
        }
end
