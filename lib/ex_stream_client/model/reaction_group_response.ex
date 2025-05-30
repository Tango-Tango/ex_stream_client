defmodule ExStreamClient.Model.ReactionGroupResponse do
  @moduledoc "Schema representing a ReactionGroupResponse"
  use ExStreamClient.Jason
  @enforce_keys [:count, :first_reaction_at, :last_reaction_at, :sum_scores]
  defstruct [:count, :first_reaction_at, :last_reaction_at, :sum_scores]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          count: integer(),
          first_reaction_at: float(),
          last_reaction_at: float(),
          sum_scores: integer()
        }
end
