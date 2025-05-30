defmodule ExStreamClient.Model.UnreadCountsBatchRequest do
  @moduledoc "Schema representing a UnreadCountsBatchRequest"
  use ExStreamClient.Jason
  @enforce_keys [:user_ids]
  defstruct [:user_ids]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{user_ids: [String.t()]}
end
