defmodule ExStreamClient.Model.ErrorResult do
  @moduledoc "Schema representing a ErrorResult"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:description, :type]
  defstruct [:description, :stacktrace, :type, :version]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          description: any(),
          stacktrace: String.t() | nil,
          type: String.t(),
          version: String.t() | nil
        }
end
