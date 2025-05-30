defmodule ExStreamClient.Model.AsyncModerationCallbackConfig do
  @moduledoc "Schema representing a AsyncModerationCallbackConfig"
  use ExStreamClient.Jason
  defstruct [:mode, :server_url]
  @nested_components mode: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          mode: (:CALLBACK_MODE_TWIRP | :CALLBACK_MODE_REST | :CALLBACK_MODE_NONE) | nil,
          server_url: String.t() | nil
        }
end
