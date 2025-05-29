defmodule ExStreamClient.Model.FileUploadConfig do
  @moduledoc "Schema representing a FileUploadConfig"
  use ExStreamClient.Jason
  @enforce_keys [:size_limit]
  defstruct [
    :size_limit,
    :allowed_file_extensions,
    :allowed_mime_types,
    :blocked_file_extensions,
    :blocked_mime_types
  ]

  @type t :: %__MODULE__{
          size_limit: integer(),
          allowed_file_extensions: [String.t()] | nil,
          allowed_mime_types: [String.t()] | nil,
          blocked_file_extensions: [String.t()] | nil,
          blocked_mime_types: [String.t()] | nil
        }
end