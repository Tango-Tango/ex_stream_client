defmodule ExStreamClient.Model.GetImportV2TaskResponse do
  @moduledoc "Schema representing a GetImportV2TaskResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:app_pk, :created_at, :duration, :id, :product, :settings, :state, :updated_at]
  defstruct [
    :app_pk,
    :created_at,
    :duration,
    :id,
    :product,
    :result,
    :settings,
    :state,
    :updated_at
  ]

  @nested_components created_at: :datetime,
                     settings: ExStreamClient.Model.ImportV2TaskSettings,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app_pk: integer(),
          created_at: DateTime.t() | integer() | String.t(),
          duration: String.t(),
          id: String.t(),
          product: String.t(),
          result: map() | nil,
          settings: ExStreamClient.Model.ImportV2TaskSettings.t(),
          state: integer(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
