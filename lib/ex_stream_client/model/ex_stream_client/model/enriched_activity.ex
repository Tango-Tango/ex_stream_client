defmodule ExStreamClient.Model.EnrichedActivity do
  @moduledoc "Schema representing a EnrichedActivity"
  use ExStreamClient.Jason

  defstruct [
    :id,
    :origin,
    :target,
    :to,
    :object,
    :reaction_counts,
    :own_reactions,
    :latest_reactions,
    :score,
    :actor,
    :foreign_id,
    :verb
  ]

  @type t :: %__MODULE__{
          id: String.t() | nil,
          origin: ExStreamClient.Model.Data.t() | nil,
          target: ExStreamClient.Model.Data.t() | nil,
          to: [String.t()] | nil,
          object: ExStreamClient.Model.Data.t() | nil,
          reaction_counts: map() | nil,
          own_reactions: map() | nil,
          latest_reactions: map() | nil,
          score: float() | nil,
          actor: ExStreamClient.Model.Data.t() | nil,
          foreign_id: String.t() | nil,
          verb: String.t() | nil
        }
end