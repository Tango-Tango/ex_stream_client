defmodule ExStreamClient.Model.BanRequest do
  @moduledoc "Schema representing a BanRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:target_user_id]
  defstruct [
    :banned_by,
    :banned_by_id,
    :channel_cid,
    :delete_messages,
    :ip_ban,
    :reason,
    :shadow,
    :target_user_id,
    :timeout
  ]

  @nested_components banned_by: ExStreamClient.Model.UserRequest, delete_messages: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          banned_by: ExStreamClient.Model.UserRequest.t() | nil,
          banned_by_id: String.t() | nil,
          channel_cid: String.t() | nil,
          delete_messages: (:hard | :pruning | :soft) | nil,
          ip_ban: boolean() | nil,
          reason: String.t() | nil,
          shadow: boolean() | nil,
          target_user_id: String.t(),
          timeout: integer() | nil
        }
end
