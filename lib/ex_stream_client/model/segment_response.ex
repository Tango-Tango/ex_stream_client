defmodule ExStreamClient.Model.SegmentResponse do
  @moduledoc "Schema representing a SegmentResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :all_sender_channels,
    :all_users,
    :created_at,
    :deleted_at,
    :description,
    :filter,
    :id,
    :name,
    :size,
    :type,
    :updated_at
  ]
  defstruct [
    :all_sender_channels,
    :all_users,
    :created_at,
    :deleted_at,
    :description,
    :filter,
    :id,
    :name,
    :size,
    :type,
    :updated_at
  ]

  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          all_sender_channels: boolean(),
          all_users: boolean(),
          created_at: float(),
          deleted_at: float(),
          description: String.t(),
          filter: map(),
          id: String.t(),
          name: String.t(),
          size: integer(),
          type: String.t(),
          updated_at: float()
        }
end
