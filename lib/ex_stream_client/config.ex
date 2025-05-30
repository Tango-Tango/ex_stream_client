defmodule ExStreamClient.Config do
  @moduledoc """
  Configuration for the Stream client.
  """

  @app :ex_stream_client
  @default_endpoint "https://chat.stream-io-api.com"

  @spec endpoint :: String.t()
  def endpoint, do: Application.get_env(@app, :endpoint, @default_endpoint)

  @spec api_key :: String.t()
  def api_key, do: Application.get_env(@app, :api_key, nil)

  @spec api_key_secret :: String.t()
  def api_key_secret, do: Application.get_env(@app, :api_key_secret, nil)
end
