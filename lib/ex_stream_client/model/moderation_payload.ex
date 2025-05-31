defmodule ExStreamClient.Model.ModerationPayload do
  @moduledoc "Schema representing a ModerationPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:custom, :images, :texts, :videos]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: %{optional(String.t()) => any()} | nil,
          images: [String.t()] | nil,
          texts: [String.t()] | nil,
          videos: [String.t()] | nil
        }
end
