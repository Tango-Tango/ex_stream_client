defmodule ExStreamClient.Operations.RateLimits do
  @moduledoc "
	Modules for interacting with the `rate_limits` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/rate_limits
	"
  require Logger
  @doc ~S"
	Get rate limits usage and quotas

	
	### Required Arguments:
		
	### Optional Arguments:
		- `server_side`
		- `android`
		- `ios`
		- `web`
		- `endpoints`
	"
  @spec get_rate_limits() ::
          {:ok, ExStreamClient.Model.GetRateLimitsResponse.t()} | {:error, any()}
  @spec get_rate_limits([
          {:endpoints, String.t()}
          | {:web, boolean()}
          | {:ios, boolean()}
          | {:android, boolean()}
          | {:server_side, boolean()}
        ]) :: {:ok, ExStreamClient.Model.GetRateLimitsResponse.t()} | {:error, any()}
  def get_rate_limits(opts \\ []) do
    request_opts =
      [
        url: "/api/v2/rate_limits",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:server_side, :android, :ios, :web, :endpoints]))
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
            200 => ExStreamClient.Model.GetRateLimitsResponse,
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
