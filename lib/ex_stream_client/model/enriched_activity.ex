defmodule ExStreamClient.Model.EnrichedActivity do
  @moduledoc "Schema representing a EnrichedActivity"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :actor,
    :foreign_id,
    :id,
    :latest_reactions,
    :object,
    :origin,
    :own_reactions,
    :reaction_counts,
    :score,
    :target,
    :to,
    :verb
  ]

  @nested_components actor: ExStreamClient.Model.Data,
                     latest_reactions: {:map, {:array, ExStreamClient.Model.EnrichedReaction}},
                     object: ExStreamClient.Model.Data,
                     origin: ExStreamClient.Model.Data,
                     own_reactions: {:map, {:array, ExStreamClient.Model.EnrichedReaction}},
                     target: ExStreamClient.Model.Data
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          actor: ExStreamClient.Model.Data.t() | nil,
          foreign_id: String.t() | nil,
          id: String.t() | nil,
          latest_reactions:
            %{optional(String.t()) => [ExStreamClient.Model.EnrichedReaction.t()]} | nil,
          object: ExStreamClient.Model.Data.t() | nil,
          origin: ExStreamClient.Model.Data.t() | nil,
          own_reactions:
            %{optional(String.t()) => [ExStreamClient.Model.EnrichedReaction.t()]} | nil,
          reaction_counts: %{optional(String.t()) => integer()} | nil,
          score: float() | nil,
          target: ExStreamClient.Model.Data.t() | nil,
          to: [String.t()] | nil,
          verb: String.t() | nil
        }
end
