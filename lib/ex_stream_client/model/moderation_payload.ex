defmodule ExStreamClient.Model.ModerationPayload do
  @moduledoc "Schema representing a ModerationPayload"
  use ExStreamClient.Jason
  defstruct [:custom, :images, :texts, :videos]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: map() | nil,
          images: [String.t()] | nil,
          texts: [String.t()] | nil,
          videos: [String.t()] | nil
        }
end
