defmodule ExStreamClient.Model.UploadChannelFileResponse do
  @moduledoc "Schema representing a UploadChannelFileResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :file, :moderation_action, :thumb_url]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          file: String.t() | nil,
          moderation_action: String.t() | nil,
          thumb_url: String.t() | nil
        }
end
