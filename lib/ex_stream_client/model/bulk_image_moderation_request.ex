defmodule ExStreamClient.Model.BulkImageModerationRequest do
  @moduledoc "Schema representing a BulkImageModerationRequest"
  use ExStreamClient.Jason
  @enforce_keys [:csv_file]
  defstruct [:csv_file]
  @type t :: %__MODULE__{csv_file: String.t()}
end