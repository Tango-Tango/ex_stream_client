defmodule ExStreamClient.Model.TranslationSettings do
  @moduledoc "Schema representing a TranslationSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:enabled, :languages]
  defstruct [:enabled, :languages]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          enabled: boolean(),
          languages: [
            :uk
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
          ]
        }
end
