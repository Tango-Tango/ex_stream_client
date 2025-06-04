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
  ### Optional Arguments:
  - `api_key`: API key to use. If not provided, the default key from config will be used.(e.g., `ExStreamClient.Config.api_key()`)
  - `api_key_secret`: API key secret to use. If not provided, the default secret from config will be used.(e.g., `ExStreamClient.Config.api_key_secret()`)
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  - `endpoint`: Endpoint to use. If not provided, the default endpoint from config will be used.(e.g., `ExStreamClient.Config.endpoint()`)
  """
  @spec send_user_custom_event(String.t(), ExStreamClient.Model.SendUserCustomEventRequest.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec send_user_custom_event(String.t(), ExStreamClient.Model.SendUserCustomEventRequest.t(), [
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
        ]) :: {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def send_user_custom_event(user_id, payload, opts \\ []) do
    client = get_client(opts)

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

    case client.request(r, get_request_opts(opts)) do
      {:ok, response} -> response.body
      {:error, error} -> {:error, error}
    end
  end

  defp get_client(opts) do
    client = Keyword.get(opts, :client, ExStreamClient.Http)

    unless Code.ensure_loaded?(client) and function_exported?(client, :request, 2) do
      raise ArgumentError,
            "client #{inspect(client)} must implement request/2 to conform to ExStreamClient.Http.Behavior"
    end

    client
  end

  defp get_request_opts(opts) do
    Keyword.take(opts, [:api_key, :api_key_secret, :endpoint])
  end
end
