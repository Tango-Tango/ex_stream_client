defmodule ExStreamClient.RateLimits do
  @moduledoc "
	Modules for interacting with the `rate_limits` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/rate_limits
	"
  require Logger
  @doc ~S"
	Get rate limits
	
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
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "GetRateLimitsResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end