defmodule ExStreamClient.Model.UpdatePollOptionRequest do
  @moduledoc "Schema representing a UpdatePollOptionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:id, :text]
  defstruct [:custom, :id, :text, :user, :user_id]

  @type t :: %__MODULE__{
          custom: map() | nil,
          id: String.t(),
          text: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end