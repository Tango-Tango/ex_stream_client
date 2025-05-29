defmodule ExStreamClient.Model.ShowChannelRequest do
  @moduledoc "Schema representing a ShowChannelRequest"
  use ExStreamClient.Jason
  defstruct [:user, :user_id]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end