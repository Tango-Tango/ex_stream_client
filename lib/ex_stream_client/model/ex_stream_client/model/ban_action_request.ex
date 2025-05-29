defmodule ExStreamClient.Model.BanActionRequest do
  @moduledoc "Schema representing a BanActionRequest"
  use ExStreamClient.Jason
  defstruct [:timeout, :reason, :shadow, :channel_ban_only, :delete_messages, :ip_ban]

  @type t :: %__MODULE__{
          timeout: integer() | nil,
          reason: String.t() | nil,
          shadow: boolean() | nil,
          channel_ban_only: boolean() | nil,
          delete_messages: (:hard | :pruning | :soft) | nil,
          ip_ban: boolean() | nil
        }
end