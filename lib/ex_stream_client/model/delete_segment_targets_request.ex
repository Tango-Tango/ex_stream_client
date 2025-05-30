defmodule ExStreamClient.Model.DeleteSegmentTargetsRequest do
  @moduledoc "Schema representing a DeleteSegmentTargetsRequest"
  use ExStreamClient.Jason
  @enforce_keys [:target_ids]
  defstruct [:target_ids]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{target_ids: [String.t()]}
end
