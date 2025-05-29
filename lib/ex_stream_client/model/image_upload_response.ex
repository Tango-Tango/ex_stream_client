defmodule ExStreamClient.Model.ImageUploadResponse do
  @moduledoc "Schema representing a ImageUploadResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :file, :thumb_url, :upload_sizes]

  @type t :: %__MODULE__{
          duration: String.t(),
          file: String.t() | nil,
          thumb_url: String.t() | nil,
          upload_sizes: [ExStreamClient.Model.ImageSize.t()] | nil
        }
end