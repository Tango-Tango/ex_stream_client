defmodule ExStreamClient.Model.SFUIDLastSeen do
  @moduledoc "Schema representing a SFUIDLastSeen"
  use ExStreamClient.Jason
  @enforce_keys [:id, :last_seen, :process_start_time]
  defstruct [:id, :last_seen, :process_start_time]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{id: String.t(), last_seen: float(), process_start_time: integer()}
end
