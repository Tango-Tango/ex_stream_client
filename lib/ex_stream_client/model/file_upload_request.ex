defmodule ExStreamClient.Model.FileUploadRequest do
  @moduledoc "Schema representing a FileUploadRequest"
  use ExStreamClient.Jason
  defstruct [:file, :user]
  @type t :: %__MODULE__{file: String.t() | nil, user: ExStreamClient.Model.OnlyUserID.t() | nil}
end