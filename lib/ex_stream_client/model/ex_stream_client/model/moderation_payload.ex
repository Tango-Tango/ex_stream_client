defmodule ExStreamClient.Model.ModerationPayload do
  @moduledoc "Schema representing a ModerationPayload"
  use ExStreamClient.Jason
  defstruct [:custom, :images, :texts, :videos]

  @type t :: %__MODULE__{
          custom: map() | nil,
          images: [String.t()] | nil,
          texts: [String.t()] | nil,
          videos: [String.t()] | nil
        }
end