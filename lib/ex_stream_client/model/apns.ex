defmodule ExStreamClient.Model.APNS do
  @moduledoc "Schema representing a APNS"
  use ExStreamClient.Jason
  @enforce_keys [:body, :title]
  defstruct [:data, :title, :body, :"content-available", :"mutable-content", :sound]

  @type t :: %__MODULE__{
          data: map() | nil,
          title: String.t(),
          body: String.t(),
          "content-available": integer() | nil,
          "mutable-content": integer() | nil,
          sound: String.t() | nil
        }
end