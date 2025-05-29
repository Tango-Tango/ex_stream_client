defmodule ExStreamClient.Model.GetOGResponse do
  @moduledoc "Schema representing a GetOGResponse"
  use ExStreamClient.Jason
  @enforce_keys [:custom, :duration]
  defstruct [
    :actions,
    :asset_url,
    :author_icon,
    :author_link,
    :author_name,
    :color,
    :custom,
    :duration,
    :fallback,
    :fields,
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
    :text,
    :thumb_url,
    :title,
    :title_link,
    :type
  ]

  @type t :: %__MODULE__{
          actions: [ExStreamClient.Model.Action.t()] | nil,
          asset_url: String.t() | nil,
          author_icon: String.t() | nil,
          author_link: String.t() | nil,
          author_name: String.t() | nil,
          color: String.t() | nil,
          custom: map(),
          duration: String.t(),
          fallback: String.t() | nil,
          fields: [ExStreamClient.Model.Field.t()] | nil,
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
          text: String.t() | nil,
          thumb_url: String.t() | nil,
          title: String.t() | nil,
          title_link: String.t() | nil,
          type: String.t() | nil
        }
end