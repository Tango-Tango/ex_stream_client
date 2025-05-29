defmodule ExStreamClient.Model.ChannelInput do
  @moduledoc "Schema representing a ChannelInput"
  use ExStreamClient.Jason

  defstruct [
    :auto_translation_enabled,
    :auto_translation_language,
    :config_overrides,
    :created_by,
    :created_by_id,
    :custom,
    :disabled,
    :frozen,
    :invites,
    :members,
    :team,
    :truncated_by_id
  ]

  @type t :: %__MODULE__{
          auto_translation_enabled: boolean() | nil,
          auto_translation_language: String.t() | nil,
          config_overrides: ExStreamClient.Model.ChannelConfig.t() | nil,
          created_by: ExStreamClient.Model.UserRequest.t() | nil,
          created_by_id: String.t() | nil,
          custom: map() | nil,
          disabled: boolean() | nil,
          frozen: boolean() | nil,
          invites: [ExStreamClient.Model.ChannelMember.t()] | nil,
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          team: String.t() | nil,
          truncated_by_id: String.t() | nil
        }
end