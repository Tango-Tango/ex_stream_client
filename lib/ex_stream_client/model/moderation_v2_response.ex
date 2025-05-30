defmodule ExStreamClient.Model.ModerationV2Response do
  @moduledoc "Schema representing a ModerationV2Response"
  use ExStreamClient.Jason
  @enforce_keys [:action, :original_text]
  defstruct [
    :action,
    :blocklist_matched,
    :image_harms,
    :original_text,
    :platform_circumvented,
    :semantic_filter_matched,
    :text_harms
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: String.t(),
          blocklist_matched: String.t() | nil,
          image_harms: [String.t()] | nil,
          original_text: String.t(),
          platform_circumvented: boolean() | nil,
          semantic_filter_matched: String.t() | nil,
          text_harms: [String.t()] | nil
        }
end
