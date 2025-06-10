# ex_stream_client

A client for [Stream](https://getstream.io) REST APIs in Elixir - auto generated from their [OpenAPI specification](https://github.com/GetStream/protocol).

## Features

- Auto-generated from the OpenAPI specification
- Fully typed and documented APIs
- Utilizes [Req](https://github.com/wojtekmach/req) for HTTP requests by default.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_stream_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_stream_client, "~> 0.1.0"}
  ]
end
```

## Configuration

The client requires the following configuration to be set in your `config.exs` file:

```elixir
config :ex_stream_client,
  api_key: "your-api-key",
  api_key_secret: "your-api-key-secret"
```

You can also configure the endpoint if you are using a custom one:

```elixir
config :ex_stream_client,
  endpoint: "https://your-custom-endpoint.com"
```

## Logging

The client supports logging of requests and responses. You can enable it by configuring the `log` option in your `config.exs` file:

```elixir
config :ex_stream_client,
  log: [
    level: :info,
    request: [:url, :body],
    response: [:status]
  ]
```

The `level` key sets the log level for all log messages. The `request` and `response` keys are lists of touchpoints to log. The available touchpoints are:

- `:url` - logs the request URL
- `:body` - logs the request body, if found
- `:status` - logs the response status

By default, all touchpoints are disabled, so nothing will be logged.

## Acknowledgements

This project includes code adapted from [ex_openai](https://github.com/dvcrn/ex_openai),
which is licensed under the MIT License. We thought the idea to generate client code via the Elixir AST was a great one!
