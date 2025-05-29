defmodule ExStreamClient.Model.Attachment do
  @moduledoc "Schema representing a Attachment"
  use ExStreamClient.Jason
  @enforce_keys [:custom]
  defstruct [
    :type,
    :title,
    :text,
    :fields,
    :color,
    :fallback,
    :custom,
    :actions,
    :asset_url,
    :author_icon,
    :author_link,
    :author_name,
    :footer,
    :footer_icon,
    :giphy,
    :image_url,
    :latitude,
    :longitude,
    :og_scrape_url,
    :original_height,
    :original_width,
    :pretext,
    :stopped_sharing,
    :thumb_url,
    :title_link
  ]

  @type t :: %__MODULE__{
          type: String.t() | nil,
          title: String.t() | nil,
          text: String.t() | nil,
          fields: [ExStreamClient.Model.Field.t()] | nil,
          color: String.t() | nil,
          fallback: String.t() | nil,
          custom: map(),
          actions: [ExStreamClient.Model.Action.t()] | nil,
          asset_url: String.t() | nil,
          author_icon: String.t() | nil,
          author_link: String.t() | nil,
          author_name: String.t() | nil,
          footer: String.t() | nil,
          footer_icon: String.t() | nil,
          giphy: ExStreamClient.Model.Images.t() | nil,
          image_url: String.t() | nil,
          latitude: float() | nil,
          longitude: float() | nil,
          og_scrape_url: String.t() | nil,
          original_height: integer() | nil,
          original_width: integer() | nil,
          pretext: String.t() | nil,
          stopped_sharing: boolean() | nil,
          thumb_url: String.t() | nil,
          title_link: String.t() | nil
        }
end