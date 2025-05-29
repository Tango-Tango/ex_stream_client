defmodule ExStreamClient.Model.GetConfigResponse do
  @moduledoc "Schema representing a GetConfigResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:config, :duration]

  @type t :: %__MODULE__{
          config: ExStreamClient.Model.ConfigResponse.t() | nil,
          duration: String.t()
        }
end