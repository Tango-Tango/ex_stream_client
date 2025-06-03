defmodule ExStreamClient.Operations.ImportUrls do
  @moduledoc ~S"""
  Modules for interacting with the `import_urls` group of Stream APIs

  API Reference: https://getstream.github.io/protocol/?urls.primaryName=Chat%20v2
  """
  require Logger

  @doc ~S"""
  Creates a new import URL


  ### Required Arguments:
  - `payload`: `Elixir.ExStreamClient.Model.CreateImportURLRequest`
  """
  @spec create_import_url(ExStreamClient.Model.CreateImportURLRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateImportURLResponse.t()} | {:error, any()}
  def create_import_url(payload) do
    request_opts = [url: "/api/v2/import_urls", method: :post, params: []] ++ [json: payload]

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
            201 => ExStreamClient.Model.CreateImportURLResponse,
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
