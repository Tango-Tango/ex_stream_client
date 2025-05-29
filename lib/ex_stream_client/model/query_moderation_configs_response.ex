defmodule ExStreamClient.Model.QueryModerationConfigsResponse do
  @moduledoc "Schema representing a QueryModerationConfigsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:configs, :duration]
  defstruct [:configs, :duration, :next, :prev]

  @type t :: %__MODULE__{
          configs: [ExStreamClient.Model.ConfigResponse.t()],
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil
        }
end