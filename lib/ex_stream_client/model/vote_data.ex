defmodule ExStreamClient.Model.VoteData do
  @moduledoc "Schema representing a VoteData"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:answer_text, :option, :option_id]
  @nested_components option: ExStreamClient.Model.PollOptionResponseData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          answer_text: String.t() | nil,
          option: ExStreamClient.Model.PollOptionResponseData.t() | nil,
          option_id: String.t() | nil
        }
end
