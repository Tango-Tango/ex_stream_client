defmodule ExStreamClient.Model.TranscriptionSettingsResponse do
  @moduledoc "Schema representing a TranscriptionSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:closed_caption_mode, :language, :mode]
  defstruct [:closed_caption_mode, :language, :mode]
  @nested_components %{mode: :atom, language: :atom, closed_caption_mode: :atom}
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
          mode: :"auto-on" | :disabled | :available
        }
end
