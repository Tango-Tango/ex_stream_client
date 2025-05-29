defmodule ExStreamClient.Model.QueryDraftsResponse do
  @moduledoc "Schema representing a QueryDraftsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:drafts, :duration]
  defstruct [:next, :prev, :duration, :drafts]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t(),
          drafts: [ExStreamClient.Model.DraftResponse.t()]
        }
end