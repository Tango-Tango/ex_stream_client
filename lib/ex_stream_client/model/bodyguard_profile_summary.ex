defmodule ExStreamClient.Model.BodyguardProfileSummary do
  @moduledoc "Schema representing a BodyguardProfileSummary"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:name]
  defstruct [:display_name, :name, :text_type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          display_name: String.t() | nil,
          name: String.t(),
          text_type: String.t() | nil
        }
end
