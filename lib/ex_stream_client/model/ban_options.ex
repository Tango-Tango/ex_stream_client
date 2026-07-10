defmodule ExStreamClient.Model.BanOptions do
  @moduledoc "Schema representing a BanOptions"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:delete_messages, :duration, :ip_ban, :reason, :shadow_ban]
  @nested_components delete_messages: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          delete_messages: (:hard | :pruning | :soft) | nil,
          duration: integer() | nil,
          ip_ban: boolean() | nil,
          reason: String.t() | nil,
          shadow_ban: boolean() | nil
        }
end
