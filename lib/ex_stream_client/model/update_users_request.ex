defmodule ExStreamClient.Model.UpdateUsersRequest do
  @moduledoc "Schema representing a UpdateUsersRequest"
  use ExStreamClient.Jason
  @enforce_keys [:users]
  defstruct [:users]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{users: map()}
end
