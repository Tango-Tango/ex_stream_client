defmodule ExStreamClient.Model.VelocityFilterConfigRule do
  @moduledoc "Schema representing a VelocityFilterConfigRule"
  use ExStreamClient.Jason

  @enforce_keys [
    :action,
    :ban_duration,
    :cascading_action,
    :cascading_threshold,
    :check_message_context,
    :fast_spam_threshold,
    :fast_spam_ttl,
    :ip_ban,
    :probation_period,
    :shadow_ban,
    :slow_spam_threshold,
    :slow_spam_ttl,
    :url_only
  ]
  defstruct [
    :action,
    :ip_ban,
    :shadow_ban,
    :ban_duration,
    :cascading_action,
    :cascading_threshold,
    :check_message_context,
    :fast_spam_threshold,
    :fast_spam_ttl,
    :probation_period,
    :slow_spam_threshold,
    :slow_spam_ttl,
    :url_only,
    :slow_spam_ban_duration
  ]

  @type t :: %__MODULE__{
          action: :ban | :remove | :shadow | :flag,
          ip_ban: boolean(),
          shadow_ban: boolean(),
          ban_duration: integer(),
          cascading_action: :ban | :remove | :shadow | :flag,
          cascading_threshold: integer(),
          check_message_context: boolean(),
          fast_spam_threshold: integer(),
          fast_spam_ttl: integer(),
          probation_period: integer(),
          slow_spam_threshold: integer(),
          slow_spam_ttl: integer(),
          url_only: boolean(),
          slow_spam_ban_duration: integer() | nil
        }
end