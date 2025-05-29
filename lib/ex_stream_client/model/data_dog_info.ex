defmodule ExStreamClient.Model.DataDogInfo do
  @moduledoc "Schema representing a DataDogInfo"
  use ExStreamClient.Jason
  defstruct [:api_key, :enabled, :site]

  @type t :: %__MODULE__{
          api_key: String.t() | nil,
          enabled: boolean() | nil,
          site: String.t() | nil
        }
end