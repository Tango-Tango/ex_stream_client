defmodule ExStreamClient.Model.ChannelMutedEvent do
  @moduledoc "Schema representing a ChannelMutedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:created_at, :custom, :mute, :mutes, :received_at, :type, :user]

  @nested_components created_at: :datetime,
                     mute: ExStreamClient.Model.ChannelMute,
                     mutes: ExStreamClient.Model.ChannelMute,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          mute: ExStreamClient.Model.ChannelMute.t() | nil,
          mutes: [ExStreamClient.Model.ChannelMute.t()] | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil
        }
end
