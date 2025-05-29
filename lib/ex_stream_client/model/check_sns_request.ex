defmodule ExStreamClient.Model.CheckSNSRequest do
  @moduledoc "Schema representing a CheckSNSRequest"
  use ExStreamClient.Jason
  defstruct [:sns_key, :sns_secret, :sns_topic_arn]

  @type t :: %__MODULE__{
          sns_key: String.t() | nil,
          sns_secret: String.t() | nil,
          sns_topic_arn: String.t() | nil
        }
end