defmodule ExStreamClient.Model.RuleBuilderAction do
  @moduledoc "Schema representing a RuleBuilderAction"
  use ExStreamClient.Jason
  defstruct [:reason, :type, :duration, :ip_ban, :shadow_ban]

  @type t :: %__MODULE__{
          reason: String.t() | nil,
          type: String.t() | nil,
          duration: integer() | nil,
          ip_ban: boolean() | nil,
          shadow_ban: boolean() | nil
        }
end