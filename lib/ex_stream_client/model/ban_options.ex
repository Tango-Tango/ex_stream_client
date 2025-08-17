defmodule ExStreamClient.Model.BanOptions do
  @moduledoc "Schema representing a BanOptions"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :ip_ban, :reason, :shadow_ban]
  defstruct [:duration, :ip_ban, :reason, :shadow_ban]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: integer(),
          ip_ban: boolean(),
          reason: String.t(),
          shadow_ban: boolean()
        }
end
