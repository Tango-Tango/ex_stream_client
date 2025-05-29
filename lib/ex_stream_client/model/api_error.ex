defmodule ExStreamClient.Model.APIError do
  @moduledoc "Schema representing a APIError"
  use ExStreamClient.Jason
  @enforce_keys [:status_code, :code, :details, :duration, :message, :more_info]
  defstruct [
    :code,
    :message,
    :details,
    :duration,
    :status_code,
    :more_info,
    :exception_fields,
    :unrecoverable
  ]

  @type t :: %__MODULE__{
          code: integer(),
          message: String.t(),
          details: [integer()],
          duration: String.t(),
          status_code: integer(),
          more_info: String.t(),
          exception_fields: map() | nil,
          unrecoverable: boolean() | nil
        }
end