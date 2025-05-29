defmodule ExStreamClient.Model.CheckSQSRequest do
  @moduledoc "Schema representing a CheckSQSRequest"
  use ExStreamClient.Jason
  defstruct [:sqs_key, :sqs_secret, :sqs_url]

  @type t :: %__MODULE__{
          sqs_key: String.t() | nil,
          sqs_secret: String.t() | nil,
          sqs_url: String.t() | nil
        }
end