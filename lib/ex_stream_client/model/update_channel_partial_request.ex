defmodule ExStreamClient.Model.UpdateChannelPartialRequest do
  @moduledoc "Schema representing a UpdateChannelPartialRequest"
  use ExStreamClient.Jason
  defstruct [:set, :user, :unset, :user_id]

  @type t :: %__MODULE__{
          set: map() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          unset: [String.t()] | nil,
          user_id: String.t() | nil
        }
end