defmodule ExStreamClient.Model.DataDogInfo do
  @moduledoc "Schema representing a DataDogInfo"
  use ExStreamClient.Jason
  defstruct [:enabled, :api_key, :site]

  @type t :: %__MODULE__{
          enabled: boolean() | nil,
          api_key: String.t() | nil,
          site: String.t() | nil
        }
end