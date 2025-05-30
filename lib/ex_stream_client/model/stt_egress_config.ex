defmodule ExStreamClient.Model.STTEgressConfig do
  @moduledoc "Schema representing a STTEgressConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :closed_captions_enabled,
    :external_storage,
    :language,
    :storage_name,
    :translation_languages,
    :translations_enabled,
    :upload_transcriptions,
    :whisper_server_base_url
  ]

  @nested_components external_storage: ExStreamClient.Model.ExternalStorage
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          closed_captions_enabled: boolean() | nil,
          external_storage: ExStreamClient.Model.ExternalStorage.t() | nil,
          language: String.t() | nil,
          storage_name: String.t() | nil,
          translation_languages: [String.t()] | nil,
          translations_enabled: boolean() | nil,
          upload_transcriptions: boolean() | nil,
          whisper_server_base_url: String.t() | nil
        }
end
