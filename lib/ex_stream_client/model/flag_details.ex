defmodule ExStreamClient.Model.FlagDetails do
  @moduledoc "Schema representing a FlagDetails"
  use ExStreamClient.Jason
  @enforce_keys [:extra, :original_text]
  defstruct [:extra, :automod, :original_text]

  @type t :: %__MODULE__{
          extra: map(),
          automod: ExStreamClient.Model.AutomodDetails.t() | nil,
          original_text: String.t()
        }
end