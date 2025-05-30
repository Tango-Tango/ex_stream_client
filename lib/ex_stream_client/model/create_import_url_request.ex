defmodule ExStreamClient.Model.CreateImportURLRequest do
  @moduledoc "Schema representing a CreateImportURLRequest"
  use ExStreamClient.Jason
  defstruct [:filename]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{filename: String.t() | nil}
end
