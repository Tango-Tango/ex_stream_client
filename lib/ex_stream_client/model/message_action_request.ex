defmodule ExStreamClient.Model.MessageActionRequest do
  @moduledoc "Schema representing a MessageActionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:form_data]
  defstruct [:user, :user_id, :form_data]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          form_data: map()
        }
end