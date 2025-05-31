defmodule ExStreamClient.Model.GeofenceResponse do
  @moduledoc "Schema representing a GeofenceResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:name]
  defstruct [:country_codes, :description, :name, :type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          country_codes: [String.t()] | nil,
          description: String.t() | nil,
          name: String.t(),
          type: String.t() | nil
        }
end
