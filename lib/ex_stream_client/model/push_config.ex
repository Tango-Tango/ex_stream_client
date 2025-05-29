defmodule ExStreamClient.Model.PushConfig do
  @moduledoc "Schema representing a PushConfig"
  use ExStreamClient.Jason
  @enforce_keys [:version]
  defstruct [:version, :offline_only]
  @type t :: %__MODULE__{version: :v3 | :v2 | :v1, offline_only: boolean() | nil}
end