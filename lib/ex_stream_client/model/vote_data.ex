defmodule ExStreamClient.Model.VoteData do
  @moduledoc "Schema representing a VoteData"
  use ExStreamClient.Jason
  defstruct [:answer_text, :option, :option_id]

  @type t :: %__MODULE__{
          answer_text: String.t() | nil,
          option: ExStreamClient.Model.PollOptionResponseData.t() | nil,
          option_id: String.t() | nil
        }
end