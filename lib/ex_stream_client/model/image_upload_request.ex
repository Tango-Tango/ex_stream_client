defmodule ExStreamClient.Model.ImageUploadRequest do
  @moduledoc "Schema representing a ImageUploadRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:file, :upload_sizes, :user]

  @nested_components upload_sizes: ExStreamClient.Model.ImageSize,
                     user: ExStreamClient.Model.OnlyUserID
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          file: String.t() | nil,
          upload_sizes: [ExStreamClient.Model.ImageSize.t()] | nil,
          user: ExStreamClient.Model.OnlyUserID.t() | nil
        }
end
