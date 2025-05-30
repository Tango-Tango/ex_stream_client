defmodule ExStreamClient.Model.CreateDeviceRequest do
  @moduledoc "Schema representing a CreateDeviceRequest"
  use ExStreamClient.Jason
  @enforce_keys [:id, :push_provider]
  defstruct [:id, :push_provider, :push_provider_name, :user, :user_id, :voip_token]
  @nested_components %{user: ExStreamClient.Model.UserRequest, push_provider: :atom}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          id: String.t(),
          push_provider: :xiaomi | :huawei | :apn | :firebase,
          push_provider_name: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          voip_token: boolean() | nil
        }
end
