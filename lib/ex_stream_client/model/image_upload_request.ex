defmodule ExStreamClient.Model.ImageUploadRequest do
  @moduledoc "Schema representing a ImageUploadRequest"
  use ExStreamClient.Jason
  defstruct [:file, :upload_sizes, :user]

  @type t :: %__MODULE__{
          file: String.t() | nil,
          upload_sizes: [ExStreamClient.Model.ImageSize.t()] | nil,
          user: ExStreamClient.Model.OnlyUserID.t() | nil
        }
end