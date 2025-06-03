defmodule ExStreamClient.Operations.Chat.Users do
  @moduledoc ~S"""
  Modules for interacting with the `chat/users` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Sends a custom event to a user

  ### Sends events:
  - `*`


  ### Required Arguments:
  - `user_id`
  - `payload`: `Elixir.ExStreamClient.Model.SendUserCustomEventRequest`
  """
  @spec send_user_custom_event(String.t(), ExStreamClient.Model.SendUserCustomEventRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def send_user_custom_event(user_id, payload) do
    request_opts =
      [url: "/api/v2/chat/users/#{user_id}/event", method: :post, params: []] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_type =
            if response.status in 200..299 do
              :ok
            else
              :error
            end

          response_handlers = %{
            201 => ExStreamClient.Model.Response,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {response_type, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    case ExStreamClient.HTTP.request(r) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end
end
