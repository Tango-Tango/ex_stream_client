defmodule ExStreamClient.Model.HideChannelRequest do
  @moduledoc "Schema representing a HideChannelRequest"
  use ExStreamClient.Jason
  defstruct [:clear_history, :user, :user_id]

  @type t :: %__MODULE__{
          clear_history: boolean() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end