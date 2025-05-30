defmodule ExStreamClient.MixProject do
  use Mix.Project

  @version "0.0.1"
  @source_url "https://github.com/Tango-Tango/ex_stream_client"

  def project do
    [
      app: :ex_stream_client,
      version: @version,
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      description:
        "A client for [Stream](https://getstream.io) REST APIs in Elixir - auto generated from their [OpenAPI specification](https://github.com/GetStream/protocol).",
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url
      },
      files: ~w(lib mix.exs README.md LICENSE)
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.4"},
      {:jason, "~> 1.4"},
      {:joken, "~> 2.6"},
      {:yaml_elixir, "~> 2.9", only: :dev},
      {:sourceror, "~> 1.10", only: :dev}
    ]
  end

  defp elixirc_paths(:dev), do: ["lib", "tools", "mix"]
  defp elixirc_paths(_), do: ["lib"]
end
