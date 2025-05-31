defmodule ExStreamClient.Model.FlagDetails do
  @moduledoc "Schema representing a FlagDetails"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:extra, :original_text]
  defstruct [:automod, :extra, :original_text]
  @nested_components automod: ExStreamClient.Model.AutomodDetails
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          automod: ExStreamClient.Model.AutomodDetails.t() | nil,
          extra: map(),
          original_text: String.t()
        }
end
