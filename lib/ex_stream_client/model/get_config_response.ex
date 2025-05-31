defmodule ExStreamClient.Model.GetConfigResponse do
  @moduledoc "Schema representing a GetConfigResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:config, :duration]
  @nested_components config: ExStreamClient.Model.ConfigResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          config: ExStreamClient.Model.ConfigResponse.t() | nil,
          duration: String.t()
        }
end
