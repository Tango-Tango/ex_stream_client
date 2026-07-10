defmodule ExStreamClient.Model.BlockListResponse do
  @moduledoc "Schema representing a BlockListResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:is_leet_check_enabled, :is_plural_check_enabled, :name, :type, :words]
  defstruct [
    :created_at,
    :id,
    :is_leet_check_enabled,
    :is_plural_check_enabled,
    :name,
    :team,
    :type,
    :updated_at,
    :words
  ]

  @nested_components created_at: :datetime, updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: (DateTime.t() | integer() | String.t()) | nil,
          id: String.t() | nil,
          is_leet_check_enabled: boolean(),
          is_plural_check_enabled: boolean(),
          name: String.t(),
          team: String.t() | nil,
          type: String.t(),
          updated_at: (DateTime.t() | integer() | String.t()) | nil,
          words: [String.t()]
        }
end
