defmodule ExStreamClient.Model.Permission do
  @moduledoc "Schema representing a Permission"
  use ExStreamClient.Jason
  @enforce_keys [:action, :custom, :description, :id, :level, :name, :owner, :same_team, :tags]
  defstruct [
    :id,
    :name,
    :owner,
    :level,
    :description,
    :action,
    :tags,
    :custom,
    :same_team,
    :condition
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          owner: boolean(),
          level: :channel | :app,
          description: String.t(),
          action: String.t(),
          tags: [String.t()],
          custom: boolean(),
          same_team: boolean(),
          condition: map() | nil
        }
end