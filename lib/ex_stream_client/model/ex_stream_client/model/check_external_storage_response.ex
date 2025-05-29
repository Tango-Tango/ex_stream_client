defmodule ExStreamClient.Model.CheckExternalStorageResponse do
  @moduledoc "Schema representing a CheckExternalStorageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :file_url]
  defstruct [:duration, :file_url]
  @type t :: %__MODULE__{duration: String.t(), file_url: String.t()}
end