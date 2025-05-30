defmodule ExStreamClient.Model.ReactivateUserRequest do
  @moduledoc "Schema representing a ReactivateUserRequest"
  use ExStreamClient.Jason
  defstruct [:created_by_id, :name, :restore_messages]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_by_id: String.t() | nil,
          name: String.t() | nil,
          restore_messages: boolean() | nil
        }
end
