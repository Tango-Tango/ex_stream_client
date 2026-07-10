defmodule ExStreamClient.Model.UploadChannelResponse do
  @moduledoc "Schema representing a UploadChannelResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :file, :moderation_action, :thumb_url, :upload_sizes]
  @nested_components upload_sizes: ExStreamClient.Model.ImageSize
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          file: String.t() | nil,
          moderation_action: String.t() | nil,
          thumb_url: String.t() | nil,
          upload_sizes: [ExStreamClient.Model.ImageSize.t()] | nil
        }
end
