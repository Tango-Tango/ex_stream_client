defmodule ExStreamClient.Model.UpdateCommandResponse do
  @moduledoc "Schema representing a UpdateCommandResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:command, :duration]
  @nested_components %{command: ExStreamClient.Model.Command}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{command: ExStreamClient.Model.Command.t() | nil, duration: String.t()}
end
