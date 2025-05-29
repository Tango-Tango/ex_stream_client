defmodule ExStreamClient.Client do
  @doc false
  @spec request(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def request(%Req.Request{} = request) do
    config = Application.get_env(:ex_stream_chat, :client, [])
    base_url = Keyword.get(config, :base_url, "https://google.com")
    auth_token = Keyword.get(config, :auth_token)

    req =
      request
      |> Req.merge(base_url: base_url)
      |> Req.Request.put_header("authorization", "Bearer #{auth_token}")
      |> Req.Request.append_request_steps(
        debug_url: fn request ->
          IO.inspect(URI.to_string(request.url))
          request
        end
      )

    Req.request(req)
  end
end
