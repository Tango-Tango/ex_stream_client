defmodule ExStreamClient.Model.VelocityFilterConfigRule do
  @moduledoc "Schema representing a VelocityFilterConfigRule"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action]
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

  @nested_components action: :enum, cascading_action: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: :ban | :remove | :shadow | :flag,
          ban_duration: integer() | nil,
          cascading_action: (:ban | :remove | :shadow | :flag) | nil,
          cascading_threshold: integer() | nil,
          check_message_context: boolean() | nil,
          fast_spam_threshold: integer() | nil,
          fast_spam_ttl: integer() | nil,
          ip_ban: boolean() | nil,
          probation_period: integer() | nil,
          shadow_ban: boolean() | nil,
          slow_spam_ban_duration: integer() | nil,
          slow_spam_threshold: integer() | nil,
          slow_spam_ttl: integer() | nil,
          url_only: boolean() | nil
        }
end
