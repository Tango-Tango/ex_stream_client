defmodule ExStreamClient.Model.CheckPushRequest do
  @moduledoc "Schema representing a CheckPushRequest"
  use ExStreamClient.Jason

  defstruct [
    :user,
    :user_id,
    :message_id,
    :apn_template,
    :skip_devices,
    :push_provider_name,
    :firebase_data_template,
    :firebase_template,
    :push_provider_type
  ]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          message_id: String.t() | nil,
          apn_template: String.t() | nil,
          skip_devices: boolean() | nil,
          push_provider_name: String.t() | nil,
          firebase_data_template: String.t() | nil,
          firebase_template: String.t() | nil,
          push_provider_type: (:xiaomi | :huawei | :apn | :firebase) | nil
        }
end