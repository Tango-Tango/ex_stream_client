defmodule ExStreamClient.Model.UpdateBlockListRequest do
  @moduledoc "Schema representing a UpdateBlockListRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:is_leet_check_enabled, :is_plural_check_enabled, :team, :words]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          is_leet_check_enabled: boolean() | nil,
          is_plural_check_enabled: boolean() | nil,
          team: String.t() | nil,
          words: [String.t()] | nil
        }
end
