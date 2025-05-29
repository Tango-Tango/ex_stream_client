defmodule ExStreamClient.Model.CompositeAppSettings do
  @moduledoc "Schema representing a CompositeAppSettings"
  use ExStreamClient.Jason
  defstruct [:url, :json_encoded_settings]
  @type t :: %__MODULE__{url: String.t() | nil, json_encoded_settings: String.t() | nil}
end