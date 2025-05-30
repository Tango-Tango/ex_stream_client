defmodule ExStreamClient.Model.CreateImportURLResponse do
  @moduledoc "Schema representing a CreateImportURLResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :path, :upload_url]
  defstruct [:duration, :path, :upload_url]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), path: String.t(), upload_url: String.t()}
end
