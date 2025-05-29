defmodule ExStreamClient.Model.BanRequest do
  @moduledoc "Schema representing a BanRequest"
  use ExStreamClient.Jason
  @enforce_keys [:target_user_id]
  defstruct [
    :timeout,
    :reason,
    :shadow,
    :target_user_id,
    :channel_cid,
    :delete_messages,
    :ip_ban,
    :banned_by,
    :banned_by_id
  ]

  @type t :: %__MODULE__{
          timeout: integer() | nil,
          reason: String.t() | nil,
          shadow: boolean() | nil,
          target_user_id: String.t(),
          channel_cid: String.t() | nil,
          delete_messages: (:hard | :pruning | :soft) | nil,
          ip_ban: boolean() | nil,
          banned_by: ExStreamClient.Model.UserRequest.t() | nil,
          banned_by_id: String.t() | nil
        }
end