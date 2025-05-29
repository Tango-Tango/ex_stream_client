defmodule ExStreamClient.Model.FlagDetails do
  @moduledoc "Schema representing a FlagDetails"
  use ExStreamClient.Jason
  @enforce_keys [:extra, :original_text]
  defstruct [:automod, :extra, :original_text]

  @type t :: %__MODULE__{
          automod: ExStreamClient.Model.AutomodDetails.t() | nil,
          extra: map(),
          original_text: String.t()
        }
end