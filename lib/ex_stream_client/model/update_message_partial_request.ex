defmodule ExStreamClient.Model.UpdateMessagePartialRequest do
  @moduledoc "Schema representing a UpdateMessagePartialRequest"
  use ExStreamClient.Jason
  defstruct [:set, :user, :unset, :user_id, :skip_enrich_url]

  @type t :: %__MODULE__{
          set: map() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          unset: [String.t()] | nil,
          user_id: String.t() | nil,
          skip_enrich_url: boolean() | nil
        }
end