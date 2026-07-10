defmodule ExStreamClient.Model.ChannelBatchCompletedEvent do
  @moduledoc "Schema representing a ChannelBatchCompletedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :batch_created_at,
    :created_at,
    :custom,
    :failed_channels,
    :finished_at,
    :operation,
    :status,
    :success_channels_count,
    :task_id,
    :type
  ]
  defstruct [
    :batch_created_at,
    :created_at,
    :custom,
    :failed_channels,
    :finished_at,
    :operation,
    :received_at,
    :status,
    :success_channels_count,
    :task_id,
    :type
  ]

  @nested_components batch_created_at: :datetime,
                     created_at: :datetime,
                     failed_channels: ExStreamClient.Model.FailedChannelUpdates,
                     finished_at: :datetime,
                     received_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          batch_created_at: DateTime.t() | integer() | String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          failed_channels: [ExStreamClient.Model.FailedChannelUpdates.t()],
          finished_at: DateTime.t() | integer() | String.t(),
          operation: String.t(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          status: String.t(),
          success_channels_count: integer(),
          task_id: String.t(),
          type: String.t()
        }
end
