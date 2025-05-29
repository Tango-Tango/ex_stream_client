defmodule ExStreamClient.Model.HideChannelRequest do
  @moduledoc "Schema representing a HideChannelRequest"
  use ExStreamClient.Jason
  defstruct [:user, :user_id, :clear_history]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          clear_history: boolean() | nil
        }
end