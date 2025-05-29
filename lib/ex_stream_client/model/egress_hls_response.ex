defmodule ExStreamClient.Model.EgressHLSResponse do
  @moduledoc "Schema representing a EgressHLSResponse"
  use ExStreamClient.Jason
  @enforce_keys [:playlist_url, :status]
  defstruct [:playlist_url, :status]
  @type t :: %__MODULE__{playlist_url: String.t(), status: String.t()}
end