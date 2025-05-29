defmodule ExStreamClient.Model.UpdatePollOptionRequest do
  @moduledoc "Schema representing a UpdatePollOptionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:id, :text]
  defstruct [:id, :user, :text, :custom, :user_id]

  @type t :: %__MODULE__{
          id: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          text: String.t(),
          custom: map() | nil,
          user_id: String.t() | nil
        }
end