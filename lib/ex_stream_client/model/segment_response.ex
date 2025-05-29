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
    :id,
    :name,
    :size,
    :type,
    :description,
    :filter,
    :created_at,
    :updated_at,
    :deleted_at,
    :all_sender_channels,
    :all_users
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          size: integer(),
          type: String.t(),
          description: String.t(),
          filter: map(),
          created_at: float(),
          updated_at: float(),
          deleted_at: float(),
          all_sender_channels: boolean(),
          all_users: boolean()
        }
end