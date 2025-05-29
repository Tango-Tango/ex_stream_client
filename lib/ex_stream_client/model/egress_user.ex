defmodule ExStreamClient.Model.EgressUser do
  @moduledoc "Schema representing a EgressUser"
  use ExStreamClient.Jason
  defstruct [:token]
  @type t :: %__MODULE__{token: String.t() | nil}
end