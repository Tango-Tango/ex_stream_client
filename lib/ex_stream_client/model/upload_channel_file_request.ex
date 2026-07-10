defmodule ExStreamClient.Model.UploadChannelFileRequest do
  @moduledoc "Schema representing a UploadChannelFileRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:file, :user]
  @nested_components user: ExStreamClient.Model.OnlyUserID
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{file: String.t() | nil, user: ExStreamClient.Model.OnlyUserID.t() | nil}
end
