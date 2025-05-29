defmodule ExStreamClient.Model.PushPreferenceInput do
  @moduledoc "Schema representing a PushPreferenceInput"
  use ExStreamClient.Jason
  defstruct [:user_id, :channel_cid, :chat_level, :disabled_until, :remove_disable]

  @type t :: %__MODULE__{
          user_id: String.t() | nil,
          channel_cid: String.t() | nil,
          chat_level: (:default | :none | :mentions | :all) | nil,
          disabled_until: float() | nil,
          remove_disable: boolean() | nil
        }
end