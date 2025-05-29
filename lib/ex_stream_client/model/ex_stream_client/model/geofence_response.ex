defmodule ExStreamClient.Model.GeofenceResponse do
  @moduledoc "Schema representing a GeofenceResponse"
  use ExStreamClient.Jason
  @enforce_keys [:name]
  defstruct [:name, :type, :description, :country_codes]

  @type t :: %__MODULE__{
          name: String.t(),
          type: String.t() | nil,
          description: String.t() | nil,
          country_codes: [String.t()] | nil
        }
end