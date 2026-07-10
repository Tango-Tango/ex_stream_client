defmodule ExStreamClient.Model.ChatReactionGroupResponse do
  @moduledoc "Schema representing a ChatReactionGroupResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:count, :first_reaction_at, :last_reaction_at, :latest_reactions_by, :sum_scores]
  defstruct [:count, :first_reaction_at, :last_reaction_at, :latest_reactions_by, :sum_scores]

  @nested_components first_reaction_at: :datetime,
                     last_reaction_at: :datetime,
                     latest_reactions_by: ExStreamClient.Model.ChatReactionGroupUserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          count: integer(),
          first_reaction_at: DateTime.t() | integer() | String.t(),
          last_reaction_at: DateTime.t() | integer() | String.t(),
          latest_reactions_by: [ExStreamClient.Model.ChatReactionGroupUserResponse.t()],
          sum_scores: integer()
        }
end
