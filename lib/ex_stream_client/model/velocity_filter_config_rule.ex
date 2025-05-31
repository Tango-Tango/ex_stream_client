defmodule ExStreamClient.Model.VelocityFilterConfigRule do
  @moduledoc "Schema representing a VelocityFilterConfigRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

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
    :ban_duration,
    :cascading_action,
    :cascading_threshold,
    :check_message_context,
    :fast_spam_threshold,
    :fast_spam_ttl,
    :ip_ban,
    :probation_period,
    :shadow_ban,
    :slow_spam_ban_duration,
    :slow_spam_threshold,
    :slow_spam_ttl,
    :url_only
  ]

  @nested_components action: :atom, cascading_action: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: :ban | :remove | :shadow | :flag,
          ban_duration: integer(),
          cascading_action: :ban | :remove | :shadow | :flag,
          cascading_threshold: integer(),
          check_message_context: boolean(),
          fast_spam_threshold: integer(),
          fast_spam_ttl: integer(),
          ip_ban: boolean(),
          probation_period: integer(),
          shadow_ban: boolean(),
          slow_spam_ban_duration: integer() | nil,
          slow_spam_threshold: integer(),
          slow_spam_ttl: integer(),
          url_only: boolean()
        }
end
