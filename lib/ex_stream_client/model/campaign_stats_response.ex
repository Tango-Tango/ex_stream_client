defmodule ExStreamClient.Model.CampaignStatsResponse do
  @moduledoc "Schema representing a CampaignStatsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :progress,
    :stats_channels_created,
    :stats_completed_at,
    :stats_messages_sent,
    :stats_started_at,
    :stats_users_read,
    :stats_users_sent
  ]
  defstruct [
    :progress,
    :stats_channels_created,
    :stats_completed_at,
    :stats_messages_sent,
    :stats_started_at,
    :stats_users_read,
    :stats_users_sent
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          progress: float(),
          stats_channels_created: integer(),
          stats_completed_at: float(),
          stats_messages_sent: integer(),
          stats_started_at: float(),
          stats_users_read: integer(),
          stats_users_sent: integer()
        }
end
