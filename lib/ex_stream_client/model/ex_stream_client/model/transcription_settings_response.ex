defmodule ExStreamClient.Model.TranscriptionSettingsResponse do
  @moduledoc "Schema representing a TranscriptionSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:closed_caption_mode, :language, :mode]
  defstruct [:mode, :language, :closed_caption_mode]

  @type t :: %__MODULE__{
          mode: :"auto-on" | :disabled | :available,
          language:
            :sk
            | :sl
            | :et
            | :bg
            | :uk
            | :no
            | :ms
            | :ko
            | :hr
            | :hi
            | :he
            | :tl
            | :ar
            | :zh
            | :ro
            | :hu
            | :tr
            | :th
            | :ta
            | :sv
            | :ru
            | :ja
            | :id
            | :fi
            | :el
            | :da
            | :cs
            | :ca
            | :pl
            | :pt
            | :nl
            | :it
            | :de
            | :es
            | :fr
            | :en
            | :auto,
          closed_caption_mode: :"auto-on" | :disabled | :available
        }
end