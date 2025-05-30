defmodule ExStreamClient.Model.Permission do
  @moduledoc "Schema representing a Permission"
  use ExStreamClient.Jason
  @enforce_keys [:action, :custom, :description, :id, :level, :name, :owner, :same_team, :tags]
  defstruct [
    :action,
    :condition,
    :custom,
    :description,
    :id,
    :level,
    :name,
    :owner,
    :same_team,
    :tags
  ]

  @nested_components %{level: :atom}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: String.t(),
          condition: map() | nil,
          custom: boolean(),
          description: String.t(),
          id: String.t(),
          level: :channel | :app,
          name: String.t(),
          owner: boolean(),
          same_team: boolean(),
          tags: [String.t()]
        }
end
