defmodule ExStreamClient.Model.CheckS3AccessResponse do
  @moduledoc "Schema representing a CheckS3AccessResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :success]
  defstruct [:duration, :message, :success]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), message: String.t() | nil, success: boolean()}
end
