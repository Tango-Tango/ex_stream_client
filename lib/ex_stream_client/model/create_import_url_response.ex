defmodule ExStreamClient.Model.CreateImportURLResponse do
  @moduledoc "Schema representing a CreateImportURLResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :path, :upload_url]
  defstruct [:path, :duration, :upload_url]
  @type t :: %__MODULE__{path: String.t(), duration: String.t(), upload_url: String.t()}
end