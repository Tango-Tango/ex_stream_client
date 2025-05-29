defmodule ExStreamClient.Model.FileUploadResponse do
  @moduledoc "Schema representing a FileUploadResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :file, :thumb_url]

  @type t :: %__MODULE__{
          duration: String.t(),
          file: String.t() | nil,
          thumb_url: String.t() | nil
        }
end