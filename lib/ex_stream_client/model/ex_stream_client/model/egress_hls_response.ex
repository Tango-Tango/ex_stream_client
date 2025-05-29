defmodule ExStreamClient.Model.EgressHLSResponse do
  @moduledoc "Schema representing a EgressHLSResponse"
  use ExStreamClient.Jason
  @enforce_keys [:playlist_url, :status]
  defstruct [:status, :playlist_url]
  @type t :: %__MODULE__{status: String.t(), playlist_url: String.t()}
end