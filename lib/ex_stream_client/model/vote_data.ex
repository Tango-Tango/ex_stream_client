defmodule ExStreamClient.Model.VoteData do
  @moduledoc "Schema representing a VoteData"
  use ExStreamClient.Jason
  defstruct [:option_id, :answer_text, :option]

  @type t :: %__MODULE__{
          option_id: String.t() | nil,
          answer_text: String.t() | nil,
          option: ExStreamClient.Model.PollOptionResponseData.t() | nil
        }
end