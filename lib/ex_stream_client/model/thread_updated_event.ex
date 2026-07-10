defmodule ExStreamClient.Model.ThreadUpdatedEvent do
  @moduledoc "Schema representing a ThreadUpdatedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:channel_id, :channel_type, :cid, :created_at, :custom, :received_at, :thread, :type]

  @nested_components created_at: :datetime,
                     received_at: :datetime,
                     thread: ExStreamClient.Model.ThreadResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t() | nil,
          channel_type: String.t() | nil,
          cid: String.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          thread: ExStreamClient.Model.ThreadResponse.t() | nil,
          type: String.t()
        }
end
