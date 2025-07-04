defmodule ExStreamClient.Model.PushPreferences do
  @moduledoc "Schema representing a PushPreferences"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:call_level, :chat_level, :disabled_until]
  @nested_components disabled_until: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          call_level: String.t() | nil,
          chat_level: String.t() | nil,
          disabled_until: (DateTime.t() | integer() | String.t()) | nil
        }
end
