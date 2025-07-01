defmodule ExStreamClient.Model.TranscriptionSettings do
  @moduledoc "Schema representing a TranscriptionSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:closed_caption_mode, :language, :languages, :mode]
  defstruct [:closed_caption_mode, :language, :languages, :mode]
  @nested_components closed_caption_mode: :enum, language: :enum, mode: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          closed_caption_mode: :"auto-on" | :disabled | :available,
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
          languages: any(),
          mode: :"auto-on" | :disabled | :available
        }
end
