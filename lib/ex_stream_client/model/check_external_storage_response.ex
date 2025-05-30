defmodule ExStreamClient.Model.CheckExternalStorageResponse do
  @moduledoc "Schema representing a CheckExternalStorageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :file_url]
  defstruct [:duration, :file_url]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), file_url: String.t()}
end
