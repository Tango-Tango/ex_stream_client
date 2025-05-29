defmodule ExStreamClient.Model.CheckSNSRequest do
  @moduledoc "Schema representing a CheckSNSRequest"
  use ExStreamClient.Jason
  defstruct [:sns_secret, :sns_topic_arn, :sns_key]

  @type t :: %__MODULE__{
          sns_secret: String.t() | nil,
          sns_topic_arn: String.t() | nil,
          sns_key: String.t() | nil
        }
end