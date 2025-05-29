defmodule ExStreamClient.Model.QueryDraftsResponse do
  @moduledoc "Schema representing a QueryDraftsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:drafts, :duration]
  defstruct [:drafts, :duration, :next, :prev]

  @type t :: %__MODULE__{
          drafts: [ExStreamClient.Model.DraftResponse.t()],
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil
        }
end