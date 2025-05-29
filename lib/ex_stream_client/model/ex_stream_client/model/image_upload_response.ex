defmodule ExStreamClient.Model.ImageUploadResponse do
  @moduledoc "Schema representing a ImageUploadResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:file, :duration, :thumb_url, :upload_sizes]

  @type t :: %__MODULE__{
          file: String.t() | nil,
          duration: String.t(),
          thumb_url: String.t() | nil,
          upload_sizes: [ExStreamClient.Model.ImageSize.t()] | nil
        }
end