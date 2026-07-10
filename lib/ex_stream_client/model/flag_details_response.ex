defmodule ExStreamClient.Model.FlagDetailsResponse do
  @moduledoc "Schema representing a FlagDetailsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:original_text]
  defstruct [:automod, :extra, :original_text]
  @nested_components automod: ExStreamClient.Model.AutomodDetailsResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          automod: ExStreamClient.Model.AutomodDetailsResponse.t() | nil,
          extra: %{optional(String.t()) => any()} | nil,
          original_text: String.t()
        }
end
