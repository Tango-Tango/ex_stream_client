defmodule ExStreamClient.Model.FileUploadRequest do
  @moduledoc "Schema representing a FileUploadRequest"
  use ExStreamClient.Jason
  defstruct [:file, :user]
  @nested_components %{user: ExStreamClient.Model.OnlyUserID}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{file: String.t() | nil, user: ExStreamClient.Model.OnlyUserID.t() | nil}
end
