defmodule ExStreamClient.Model.QueryDraftsResponse do
  @moduledoc "Schema representing a QueryDraftsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:drafts, :duration]
  defstruct [:drafts, :duration, :next, :prev]
  @nested_components drafts: ExStreamClient.Model.DraftResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          drafts: [ExStreamClient.Model.DraftResponse.t()],
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil
        }
end
