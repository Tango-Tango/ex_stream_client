defmodule ExStreamClient.Model.FeedsReactionGroupResponse do
  @moduledoc "Schema representing a FeedsReactionGroupResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:count, :first_reaction_at, :last_reaction_at]
  defstruct [:count, :first_reaction_at, :last_reaction_at]
  @nested_components first_reaction_at: :datetime, last_reaction_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          count: integer(),
          first_reaction_at: DateTime.t() | integer() | String.t(),
          last_reaction_at: DateTime.t() | integer() | String.t()
        }
end
