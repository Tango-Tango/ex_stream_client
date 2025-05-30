defmodule ExStreamClient.Model.ListCommandsResponse do
  @moduledoc "Schema representing a ListCommandsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:commands, :duration]
  defstruct [:commands, :duration]
  @nested_components %{commands: ExStreamClient.Model.Command}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{commands: [ExStreamClient.Model.Command.t()], duration: String.t()}
end
