defmodule ExStreamClient.Model.PushPreferenceInput do
  @moduledoc "Schema representing a PushPreferenceInput"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:call_level, :channel_cid, :chat_level, :disabled_until, :remove_disable, :user_id]
  @nested_components call_level: :enum, chat_level: :enum, disabled_until: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          call_level: (:default | :none | :all) | nil,
          channel_cid: String.t() | nil,
          chat_level: (:default | :none | :mentions | :all) | nil,
          disabled_until: (DateTime.t() | integer() | String.t()) | nil,
          remove_disable: boolean() | nil,
          user_id: String.t() | nil
        }
end
