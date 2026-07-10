defmodule ExStreamClient.Model.ChannelInputRequest do
  @moduledoc "Schema representing a ChannelInputRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :auto_translation_enabled,
    :auto_translation_language,
    :config_overrides,
    :created_by,
    :custom,
    :disabled,
    :frozen,
    :invites,
    :members,
    :team
  ]

  @nested_components config_overrides: ExStreamClient.Model.ConfigOverridesRequest,
                     created_by: ExStreamClient.Model.UserRequest,
                     invites: ExStreamClient.Model.ChannelMemberRequest,
                     members: ExStreamClient.Model.ChannelMemberRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          auto_translation_enabled: boolean() | nil,
          auto_translation_language: String.t() | nil,
          config_overrides: ExStreamClient.Model.ConfigOverridesRequest.t() | nil,
          created_by: ExStreamClient.Model.UserRequest.t() | nil,
          custom: %{optional(String.t()) => any()} | nil,
          disabled: boolean() | nil,
          frozen: boolean() | nil,
          invites: [ExStreamClient.Model.ChannelMemberRequest.t()] | nil,
          members: [ExStreamClient.Model.ChannelMemberRequest.t()] | nil,
          team: String.t() | nil
        }
end
