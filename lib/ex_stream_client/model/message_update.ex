defmodule ExStreamClient.Model.MessageUpdate do
  @moduledoc "Schema representing a MessageUpdate"
  use ExStreamClient.Jason
  defstruct [:change_set, :old_text]

  @type t :: %__MODULE__{
          change_set: ExStreamClient.Model.MessageChangeSet.t() | nil,
          old_text: String.t() | nil
        }
end