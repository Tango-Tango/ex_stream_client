defmodule ExStreamClient.Model.DeactivateUsersResponse do
  @moduledoc "Schema representing a DeactivateUsersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :task_id]
  defstruct [:duration, :task_id]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), task_id: String.t()}
end
