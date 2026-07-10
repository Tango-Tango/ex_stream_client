defmodule ExStreamClient.Model.BypassRequest do
  @moduledoc "Schema representing a BypassRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled, :target_user_id]
  defstruct [:enabled, :target_user_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{enabled: boolean(), target_user_id: String.t()}
end
