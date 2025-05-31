defmodule ExStreamClient.Model.PushPreferenceInput do
  @moduledoc "Schema representing a PushPreferenceInput"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:channel_cid, :chat_level, :disabled_until, :remove_disable, :user_id]
  @nested_components chat_level: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_cid: String.t() | nil,
          chat_level: (:default | :none | :mentions | :all) | nil,
          disabled_until: float() | nil,
          remove_disable: boolean() | nil,
          user_id: String.t() | nil
        }
end
