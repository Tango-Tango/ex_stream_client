defmodule ExStreamClient.Model.GetDraftResponse do
  @moduledoc "Schema representing a GetDraftResponse"
  use ExStreamClient.Jason
  @enforce_keys [:draft, :duration]
  defstruct [:duration, :draft]
  @type t :: %__MODULE__{duration: String.t(), draft: ExStreamClient.Model.DraftResponse.t()}
end