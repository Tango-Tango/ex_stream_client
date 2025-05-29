defmodule ExStreamClient.Model.UserRequest do
  @moduledoc "Schema representing a UserRequest"
  use ExStreamClient.Jason
  @enforce_keys [:id]
  defstruct [
    :id,
    :name,
    :image,
    :role,
    :language,
    :custom,
    :invisible,
    :privacy_settings,
    :teams,
    :teams_role
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t() | nil,
          image: String.t() | nil,
          role: String.t() | nil,
          language: String.t() | nil,
          custom: map() | nil,
          invisible: boolean() | nil,
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          teams: [String.t()] | nil,
          teams_role: map() | nil
        }
end