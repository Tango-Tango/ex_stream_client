defmodule ExStreamClient.Model.TeamUsageStats do
  @moduledoc "Schema representing a TeamUsageStats"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :concurrent_connections,
    :concurrent_users,
    :image_moderations_daily,
    :messages_daily,
    :messages_last_24_hours,
    :messages_last_30_days,
    :messages_month_to_date,
    :messages_total,
    :team,
    :translations_daily,
    :users_daily,
    :users_engaged_last_30_days,
    :users_engaged_month_to_date,
    :users_last_24_hours,
    :users_last_30_days,
    :users_month_to_date,
    :users_total
  ]
  defstruct [
    :concurrent_connections,
    :concurrent_users,
    :image_moderations_daily,
    :messages_daily,
    :messages_last_24_hours,
    :messages_last_30_days,
    :messages_month_to_date,
    :messages_total,
    :team,
    :translations_daily,
    :users_daily,
    :users_engaged_last_30_days,
    :users_engaged_month_to_date,
    :users_last_24_hours,
    :users_last_30_days,
    :users_month_to_date,
    :users_total
  ]

  @nested_components concurrent_connections: ExStreamClient.Model.MetricStats,
                     concurrent_users: ExStreamClient.Model.MetricStats,
                     image_moderations_daily: ExStreamClient.Model.MetricStats,
                     messages_daily: ExStreamClient.Model.MetricStats,
                     messages_last_24_hours: ExStreamClient.Model.MetricStats,
                     messages_last_30_days: ExStreamClient.Model.MetricStats,
                     messages_month_to_date: ExStreamClient.Model.MetricStats,
                     messages_total: ExStreamClient.Model.MetricStats,
                     translations_daily: ExStreamClient.Model.MetricStats,
                     users_daily: ExStreamClient.Model.MetricStats,
                     users_engaged_last_30_days: ExStreamClient.Model.MetricStats,
                     users_engaged_month_to_date: ExStreamClient.Model.MetricStats,
                     users_last_24_hours: ExStreamClient.Model.MetricStats,
                     users_last_30_days: ExStreamClient.Model.MetricStats,
                     users_month_to_date: ExStreamClient.Model.MetricStats,
                     users_total: ExStreamClient.Model.MetricStats
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          concurrent_connections: ExStreamClient.Model.MetricStats.t(),
          concurrent_users: ExStreamClient.Model.MetricStats.t(),
          image_moderations_daily: ExStreamClient.Model.MetricStats.t(),
          messages_daily: ExStreamClient.Model.MetricStats.t(),
          messages_last_24_hours: ExStreamClient.Model.MetricStats.t(),
          messages_last_30_days: ExStreamClient.Model.MetricStats.t(),
          messages_month_to_date: ExStreamClient.Model.MetricStats.t(),
          messages_total: ExStreamClient.Model.MetricStats.t(),
          team: String.t(),
          translations_daily: ExStreamClient.Model.MetricStats.t(),
          users_daily: ExStreamClient.Model.MetricStats.t(),
          users_engaged_last_30_days: ExStreamClient.Model.MetricStats.t(),
          users_engaged_month_to_date: ExStreamClient.Model.MetricStats.t(),
          users_last_24_hours: ExStreamClient.Model.MetricStats.t(),
          users_last_30_days: ExStreamClient.Model.MetricStats.t(),
          users_month_to_date: ExStreamClient.Model.MetricStats.t(),
          users_total: ExStreamClient.Model.MetricStats.t()
        }
end
