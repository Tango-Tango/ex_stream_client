defmodule ExStreamClient.Model.TranslateMessageRequest do
  @moduledoc "Schema representing a TranslateMessageRequest"
  use ExStreamClient.Jason
  @enforce_keys [:language]
  defstruct [:language]
  @nested_components language: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          language:
            :ht
            | :lt
            | :vi
            | :ur
            | :uk
            | :tr
            | :th
            | :ta
            | :tl
            | :sv
            | :sw
            | :"es-MX"
            | :es
            | :so
            | :sl
            | :sk
            | :sr
            | :ru
            | :ro
            | :pt
            | :pl
            | :ps
            | :fa
            | :no
            | :ms
            | :lv
            | :ko
            | :ja
            | :it
            | :id
            | :hu
            | :hi
            | :he
            | :ha
            | :el
            | :de
            | :ka
            | :"fr-CA"
            | :fr
            | :fi
            | :et
            | :en
            | :nl
            | :"fa-AF"
            | :da
            | :cs
            | :hr
            | :"zh-TW"
            | :zh
            | :bg
            | :bs
            | :bn
            | :az
            | :ar
            | :am
            | :sq
            | :af
        }
end
