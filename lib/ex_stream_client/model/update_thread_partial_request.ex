defmodule ExStreamClient.Model.UpdateThreadPartialRequest do
  @moduledoc "Schema representing a UpdateThreadPartialRequest"
  use ExStreamClient.Jason
  defstruct [:set, :unset, :user, :user_id]

  @type t :: %__MODULE__{
          set: map() | nil,
          unset: [String.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end