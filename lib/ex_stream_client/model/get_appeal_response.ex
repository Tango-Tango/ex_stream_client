defmodule ExStreamClient.Model.GetAppealResponse do
  @moduledoc "Schema representing a GetAppealResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :item]
  @nested_components item: ExStreamClient.Model.AppealItemResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          item: ExStreamClient.Model.AppealItemResponse.t() | nil
        }
end
