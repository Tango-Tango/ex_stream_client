defmodule ExStreamClient.Model.ModerationV2Response do
  @moduledoc "Schema representing a ModerationV2Response"
  use ExStreamClient.Jason
  @enforce_keys [:action, :original_text]
  defstruct [
    :action,
    :original_text,
    :blocklist_matched,
    :image_harms,
    :platform_circumvented,
    :semantic_filter_matched,
    :text_harms
  ]

  @type t :: %__MODULE__{
          action: String.t(),
          original_text: String.t(),
          blocklist_matched: String.t() | nil,
          image_harms: [String.t()] | nil,
          platform_circumvented: boolean() | nil,
          semantic_filter_matched: String.t() | nil,
          text_harms: [String.t()] | nil
        }
end