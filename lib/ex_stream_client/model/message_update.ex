defmodule ExStreamClient.Model.MessageUpdate do
  @moduledoc "Schema representing a MessageUpdate"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:change_set, :old_text]
  @nested_components change_set: ExStreamClient.Model.MessageChangeSet
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          change_set: ExStreamClient.Model.MessageChangeSet.t() | nil,
          old_text: String.t() | nil
        }
end
