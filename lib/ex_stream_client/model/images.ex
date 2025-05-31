defmodule ExStreamClient.Model.Images do
  @moduledoc "Schema representing a Images"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :fixed_height,
    :fixed_height_downsampled,
    :fixed_height_still,
    :fixed_width,
    :fixed_width_downsampled,
    :fixed_width_still,
    :original
  ]
  defstruct [
    :fixed_height,
    :fixed_height_downsampled,
    :fixed_height_still,
    :fixed_width,
    :fixed_width_downsampled,
    :fixed_width_still,
    :original
  ]

  @nested_components fixed_height: ExStreamClient.Model.ImageData,
                     fixed_height_downsampled: ExStreamClient.Model.ImageData,
                     fixed_height_still: ExStreamClient.Model.ImageData,
                     fixed_width: ExStreamClient.Model.ImageData,
                     fixed_width_downsampled: ExStreamClient.Model.ImageData,
                     fixed_width_still: ExStreamClient.Model.ImageData,
                     original: ExStreamClient.Model.ImageData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          fixed_height: ExStreamClient.Model.ImageData.t(),
          fixed_height_downsampled: ExStreamClient.Model.ImageData.t(),
          fixed_height_still: ExStreamClient.Model.ImageData.t(),
          fixed_width: ExStreamClient.Model.ImageData.t(),
          fixed_width_downsampled: ExStreamClient.Model.ImageData.t(),
          fixed_width_still: ExStreamClient.Model.ImageData.t(),
          original: ExStreamClient.Model.ImageData.t()
        }
end
