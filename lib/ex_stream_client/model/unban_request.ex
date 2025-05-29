defmodule ExStreamClient.Model.UnbanRequest do
  @moduledoc "Schema representing a UnbanRequest"
  use ExStreamClient.Jason
  defstruct [:unbanned_by, :unbanned_by_id]

  @type t :: %__MODULE__{
          unbanned_by: ExStreamClient.Model.UserRequest.t() | nil,
          unbanned_by_id: String.t() | nil
        }
end