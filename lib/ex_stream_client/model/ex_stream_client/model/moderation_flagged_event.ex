defmodule ExStreamClient.Model.ModerationFlaggedEvent do
  @moduledoc "Schema representing a ModerationFlaggedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:type, :user, :item, :created_at, :object_id]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          item: String.t() | nil,
          created_at: float(),
          object_id: String.t() | nil
        }
end