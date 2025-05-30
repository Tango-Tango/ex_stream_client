defmodule ExStreamClient.Model.VideoEndCallRequest do
  @moduledoc "Schema representing a VideoEndCallRequest"
  use ExStreamClient.Jason
  defstruct []
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{}
end
