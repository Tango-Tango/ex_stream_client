defmodule ExStreamClient.Model.GetDraftResponse do
  @moduledoc "Schema representing a GetDraftResponse"
  use ExStreamClient.Jason
  @enforce_keys [:draft, :duration]
  defstruct [:draft, :duration]
  @nested_components draft: ExStreamClient.Model.DraftResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{draft: ExStreamClient.Model.DraftResponse.t(), duration: String.t()}
end
