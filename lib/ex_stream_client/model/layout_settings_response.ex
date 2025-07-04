defmodule ExStreamClient.Model.LayoutSettingsResponse do
  @moduledoc "Schema representing a LayoutSettingsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:external_app_url, :external_css_url, :name]
  defstruct [:detect_orientation, :external_app_url, :external_css_url, :name, :options]
  @nested_components name: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          detect_orientation: boolean() | nil,
          external_app_url: String.t(),
          external_css_url: String.t(),
          name: :custom | :mobile | :"single-participant" | :grid | :spotlight,
          options: %{optional(String.t()) => any()} | nil
        }
end
