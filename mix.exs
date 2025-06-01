defmodule ExStreamClient.MixProject do
  use Mix.Project

  @version "0.1.2"
  @source_url "https://github.com/Tango-Tango/ex_stream_client"

  def project do
    [
      app: :ex_stream_client,
      version: @version,
      elixir: "~> 1.17",
      name: "ExStreamClient",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      docs: docs()
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
      name: "ex_stream_client",
      description:
        "A client for [Stream](https://getstream.io) REST APIs in Elixir - auto generated from their [OpenAPI specification](https://github.com/GetStream/protocol).",
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url
      },
      files: ~w(lib .formatter.exs mix.exs README* CHANGELOG* LICENSE*)
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.4"},
      {:jason, "~> 1.4"},
      {:joken, "~> 2.6"},
      {:yaml_elixir, "~> 2.9", only: :dev},
      {:sourceror, "~> 1.10", only: :dev},
      {:ex_doc, "~> 0.34", only: [:dev, :docs], runtime: false, warn_if_outdated: true}
    ]
  end

  defp docs do
    [
      main: "ExStreamClient",
      extras: ["README.md", "CHANGELOG.md"],
      source_url: @source_url,
      homepage_url: @source_url,
      # Optional
      filter_modules: &__MODULE__.docs_filter/2
    ]
  end

  defp elixirc_paths(:dev), do: ["lib", "tools", "mix"]
  defp elixirc_paths(_), do: ["lib"]

  def docs_filter(module, _docs) do
    not String.starts_with?(Atom.to_string(module), "Mix.") and
      not String.starts_with?(Atom.to_string(module), "ExStreamClient.Tools.")
  end
end
