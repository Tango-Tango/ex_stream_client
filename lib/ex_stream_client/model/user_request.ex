defmodule ExStreamClient.Model.UserRequest do
  @moduledoc "Schema representing a UserRequest"
  use ExStreamClient.Jason
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

  @type t :: %__MODULE__{
          custom: map() | nil,
          id: String.t(),
          image: String.t() | nil,
          invisible: boolean() | nil,
          language: String.t() | nil,
          name: String.t() | nil,
          privacy_settings: ExStreamClient.Model.PrivacySettingsResponse.t() | nil,
          role: String.t() | nil,
          teams: [String.t()] | nil,
          teams_role: map() | nil
        }
end