defmodule ExStreamClient.Model.QueryModerationConfigsResponse do
  @moduledoc "Schema representing a QueryModerationConfigsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:configs, :duration]
  defstruct [:next, :prev, :duration, :configs]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t(),
          configs: [ExStreamClient.Model.ConfigResponse.t()]
        }
end