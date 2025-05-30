defmodule ExStreamClient.Model.CompositeAppSettings do
  @moduledoc "Schema representing a CompositeAppSettings"
  use ExStreamClient.Jason
  defstruct [:json_encoded_settings, :url]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{json_encoded_settings: String.t() | nil, url: String.t() | nil}
end
