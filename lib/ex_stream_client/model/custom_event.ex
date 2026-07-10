defmodule ExStreamClient.Model.CustomEvent do
  @moduledoc "Schema representing a CustomEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:created_at, :custom, :received_at, :type]
  @nested_components created_at: :datetime, received_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t()
        }
end
