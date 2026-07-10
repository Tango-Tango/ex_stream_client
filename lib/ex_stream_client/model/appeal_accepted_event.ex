defmodule ExStreamClient.Model.AppealAcceptedEvent do
  @moduledoc "Schema representing a AppealAcceptedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:appeal, :created_at, :custom, :received_at, :type]

  @nested_components appeal: ExStreamClient.Model.AppealItemResponse,
                     created_at: :datetime,
                     received_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          appeal: ExStreamClient.Model.AppealItemResponse.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t()
        }
end
