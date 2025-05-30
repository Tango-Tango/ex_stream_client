defmodule ExStreamClient.Model.APIError do
  @moduledoc "Schema representing a APIError"
  use ExStreamClient.Jason
  @enforce_keys [:code, :details, :duration, :message, :more_info, :status_code]
  defstruct [
    :code,
    :details,
    :duration,
    :exception_fields,
    :message,
    :more_info,
    :status_code,
    :unrecoverable
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          code: integer(),
          details: [integer()],
          duration: String.t(),
          exception_fields: map() | nil,
          message: String.t(),
          more_info: String.t(),
          status_code: integer(),
          unrecoverable: boolean() | nil
        }
end
