defmodule ExStreamClient.Model.ThumbnailResponse do
  @moduledoc "Schema representing a ThumbnailResponse"
  use ExStreamClient.Jason
  @enforce_keys [:image_url]
  defstruct [:image_url]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{image_url: String.t()}
end
