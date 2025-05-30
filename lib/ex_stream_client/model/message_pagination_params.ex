defmodule ExStreamClient.Model.MessagePaginationParams do
  @moduledoc "Schema representing a MessagePaginationParams"
  use ExStreamClient.Jason
  defstruct []
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{}
end
