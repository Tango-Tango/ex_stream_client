defmodule ExStreamClient.Model.LayoutSettings do
  @moduledoc "Schema representing a LayoutSettings"
  use ExStreamClient.Jason
  @enforce_keys [:external_app_url, :external_css_url, :name]
  defstruct [:name, :options, :external_app_url, :external_css_url, :detect_orientation]

  @type t :: %__MODULE__{
          name: :custom | :mobile | :"single-participant" | :grid | :spotlight,
          options: map() | nil,
          external_app_url: String.t(),
          external_css_url: String.t(),
          detect_orientation: boolean() | nil
        }
end