defmodule ExStreamClient.Model.BanActionRequest do
  @moduledoc "Schema representing a BanActionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:channel_ban_only, :delete_messages, :ip_ban, :reason, :shadow, :timeout]
  @nested_components delete_messages: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_ban_only: boolean() | nil,
          delete_messages: (:hard | :pruning | :soft) | nil,
          ip_ban: boolean() | nil,
          reason: String.t() | nil,
          shadow: boolean() | nil,
          timeout: integer() | nil
        }
end
