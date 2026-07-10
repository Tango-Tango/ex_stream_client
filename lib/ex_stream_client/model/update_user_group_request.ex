defmodule ExStreamClient.Model.UpdateUserGroupRequest do
  @moduledoc "Schema representing a UpdateUserGroupRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:description, :name, :team_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t() | nil,
          team_id: String.t() | nil
        }
end
