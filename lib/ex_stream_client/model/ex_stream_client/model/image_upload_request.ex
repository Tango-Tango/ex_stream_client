defmodule ExStreamClient.Model.ImageUploadRequest do
  @moduledoc "Schema representing a ImageUploadRequest"
  use ExStreamClient.Jason
  defstruct [:file, :user, :upload_sizes]

  @type t :: %__MODULE__{
          file: String.t() | nil,
          user: ExStreamClient.Model.OnlyUserID.t() | nil,
          upload_sizes: [ExStreamClient.Model.ImageSize.t()] | nil
        }
end