defmodule ExStreamClient.Model.FeedsEnrichedCollectionResponse do
  @moduledoc "Schema representing a FeedsEnrichedCollectionResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :id, :name, :status, :updated_at, :user_id]
  defstruct [:created_at, :custom, :id, :name, :status, :updated_at, :user_id]
  @nested_components created_at: :datetime, updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          id: String.t(),
          name: String.t(),
          status: String.t(),
          updated_at: DateTime.t() | integer() | String.t(),
          user_id: String.t()
        }
end
