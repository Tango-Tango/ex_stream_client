defmodule ExStreamClient.Operations.Chat.Members do
  @moduledoc ~S"""
  Modules for interacting with the `chat/members` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Find and filter channel members


  ### Optional Arguments:
  - `api_key`: API key to use. If not provided, the default key from config will be used.(e.g., `ExStreamClient.Config.api_key()`)
  - `api_key_secret`: API key secret to use. If not provided, the default secret from config will be used.(e.g., `ExStreamClient.Config.api_key_secret()`)
  - `client`: HTTP client to use. Must implement `ExStreamClient.Http.Behavior`(e.g., `ExStreamClient.Http`)
  - `endpoint`: Endpoint to use. If not provided, the default endpoint from config will be used.(e.g., `ExStreamClient.Config.endpoint()`)
  - `payload`: `Elixir.ExStreamClient.Model.QueryMembersPayload`
  """
  @spec query_members() :: {:ok, ExStreamClient.Model.MembersResponse.t()} | {:error, any()}
  @spec query_members([
          {:client, module()}
          | {:endpoint, String.t()}
          | {:api_key, String.t()}
          | {:api_key_secret, String.t()}
          | {:payload, ExStreamClient.Model.QueryMembersPayload.t()}
        ]) :: {:ok, ExStreamClient.Model.MembersResponse.t()} | {:error, any()}
  def query_members(opts \\ []) do
    client = get_client(opts)

    request_opts =
      [
        url: "/api/v2/chat/members",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:payload]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
      ] ++ []

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
            200 => ExStreamClient.Model.MembersResponse,
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
