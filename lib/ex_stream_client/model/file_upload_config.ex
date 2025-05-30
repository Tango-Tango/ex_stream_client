defmodule ExStreamClient.Model.FileUploadConfig do
  @moduledoc "Schema representing a FileUploadConfig"
  use ExStreamClient.Jason
  @enforce_keys [:size_limit]
  defstruct [
    :allowed_file_extensions,
    :allowed_mime_types,
    :blocked_file_extensions,
    :blocked_mime_types,
    :size_limit
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          allowed_file_extensions: [String.t()] | nil,
          allowed_mime_types: [String.t()] | nil,
          blocked_file_extensions: [String.t()] | nil,
          blocked_mime_types: [String.t()] | nil,
          size_limit: integer()
        }
end
