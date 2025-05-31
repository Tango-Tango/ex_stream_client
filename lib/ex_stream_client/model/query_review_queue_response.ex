defmodule ExStreamClient.Model.QueryReviewQueueResponse do
  @moduledoc "Schema representing a QueryReviewQueueResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action_config, :duration, :items, :stats]
  defstruct [:action_config, :duration, :items, :next, :prev, :stats]

  @nested_components action_config: {:map, {:array, ExStreamClient.Model.ModerationActionConfig}},
                     items: ExStreamClient.Model.ReviewQueueItemResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_config: %{
            optional(String.t()) => [ExStreamClient.Model.ModerationActionConfig.t()]
          },
          duration: String.t(),
          items: [ExStreamClient.Model.ReviewQueueItemResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil,
          stats: %{optional(String.t()) => any()}
        }
end
