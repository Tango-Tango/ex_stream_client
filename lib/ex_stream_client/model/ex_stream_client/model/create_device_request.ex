defmodule ExStreamClient.Model.CreateDeviceRequest do
  @moduledoc "Schema representing a CreateDeviceRequest"
  use ExStreamClient.Jason
  @enforce_keys [:id, :push_provider]
  defstruct [:id, :user, :user_id, :push_provider, :push_provider_name, :voip_token]

  @type t :: %__MODULE__{
          id: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          push_provider: :xiaomi | :huawei | :apn | :firebase,
          push_provider_name: String.t() | nil,
          voip_token: boolean() | nil
        }
end