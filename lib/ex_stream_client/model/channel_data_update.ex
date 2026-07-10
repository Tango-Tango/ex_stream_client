defmodule ExStreamClient.Model.ChannelDataUpdate do
  @moduledoc "Schema representing a ChannelDataUpdate"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :auto_translation_enabled,
    :auto_translation_language,
    :config_overrides,
    :custom,
    :disabled,
    :frozen,
    :team
  ]

  @nested_components config_overrides: ExStreamClient.Model.ChannelConfig
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          auto_translation_enabled: boolean() | nil,
          auto_translation_language: String.t() | nil,
          config_overrides: ExStreamClient.Model.ChannelConfig.t() | nil,
          custom: %{optional(String.t()) => any()} | nil,
          disabled: boolean() | nil,
          frozen: boolean() | nil,
          team: String.t() | nil
        }
end
