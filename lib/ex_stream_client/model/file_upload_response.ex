defmodule ExStreamClient.Model.FileUploadResponse do
  @moduledoc "Schema representing a FileUploadResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:file, :duration, :thumb_url]

  @type t :: %__MODULE__{
          file: String.t() | nil,
          duration: String.t(),
          thumb_url: String.t() | nil
        }
end