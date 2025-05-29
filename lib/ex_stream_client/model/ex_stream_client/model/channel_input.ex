defmodule ExStreamClient.Model.ChannelInput do
  @moduledoc "Schema representing a ChannelInput"
  use ExStreamClient.Jason

  defstruct [
    :disabled,
    :custom,
    :team,
    :created_by,
    :created_by_id,
    :members,
    :auto_translation_enabled,
    :auto_translation_language,
    :config_overrides,
    :frozen,
    :invites,
    :truncated_by_id
  ]

  @type t :: %__MODULE__{
          disabled: boolean() | nil,
          custom: map() | nil,
          team: String.t() | nil,
          created_by: ExStreamClient.Model.UserRequest.t() | nil,
          created_by_id: String.t() | nil,
          members: [ExStreamClient.Model.ChannelMember.t()] | nil,
          auto_translation_enabled: boolean() | nil,
          auto_translation_language: String.t() | nil,
          config_overrides: ExStreamClient.Model.ChannelConfig.t() | nil,
          frozen: boolean() | nil,
          invites: [ExStreamClient.Model.ChannelMember.t()] | nil,
          truncated_by_id: String.t() | nil
        }
end