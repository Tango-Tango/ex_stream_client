defmodule ExStreamClient.Model.STTEgressConfig do
  @moduledoc "Schema representing a STTEgressConfig"
  use ExStreamClient.Jason

  defstruct [
    :language,
    :external_storage,
    :storage_name,
    :closed_captions_enabled,
    :translation_languages,
    :translations_enabled,
    :upload_transcriptions,
    :whisper_server_base_url
  ]

  @type t :: %__MODULE__{
          language: String.t() | nil,
          external_storage: ExStreamClient.Model.ExternalStorage.t() | nil,
          storage_name: String.t() | nil,
          closed_captions_enabled: boolean() | nil,
          translation_languages: [String.t()] | nil,
          translations_enabled: boolean() | nil,
          upload_transcriptions: boolean() | nil,
          whisper_server_base_url: String.t() | nil
        }
end