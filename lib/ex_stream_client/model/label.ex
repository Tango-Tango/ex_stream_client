defmodule ExStreamClient.Model.Label do
  @moduledoc "Schema representing a Label"
  use ExStreamClient.Jason
  @enforce_keys [:name]
  defstruct [:harm_labels, :name, :phrase_list_ids]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          harm_labels: [String.t()] | nil,
          name: String.t(),
          phrase_list_ids: [integer()] | nil
        }
end
