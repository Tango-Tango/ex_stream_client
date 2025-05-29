defmodule ExStreamClient.Model.MarkReviewedRequest do
  @moduledoc "Schema representing a MarkReviewedRequest"
  use ExStreamClient.Jason
  defstruct [:content_to_mark_as_reviewed_limit, :disable_marking_content_as_reviewed]

  @type t :: %__MODULE__{
          content_to_mark_as_reviewed_limit: integer() | nil,
          disable_marking_content_as_reviewed: boolean() | nil
        }
end