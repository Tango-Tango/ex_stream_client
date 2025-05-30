defmodule ExStreamClient.Model.UserRequest do
  @moduledoc "Schema representing a UserRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:id]
  defstruct [
    :custom,
    :id,
    :image,
    :invisible,
    :language,
    :name,
    :privacy_settings,
    :role,
    :teams,
    :teams_role
  ]

  @nested_components privacy_settings: ExStreamClient.Model.PrivacySettingsResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: %{optional(String.t()) => any()} | nil,
          id: String.t(),
          image: String.t() | nil,
          invisible: boolean() | nil,
          language: String.t() | nil,
          name: String.t() | nil,
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          role: String.t() | nil,
          teams: [String.t()] | nil,
          teams_role: %{optional(String.t()) => String.t()} | nil
        }
end
