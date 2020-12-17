defmodule NotFoundRoute.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      package: package(),
      aliases: aliases(),
      app: :not_found_route,
      name: "NotFoundRoute",
      compilers: [:phoenix] ++ Mix.compilers(),
      deps: deps(),
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      description: "Show all routes on accessing a non-existing route.",
      version: @version
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {NotFoundRoute.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:phoenix, ">= 1.4.0"},
      {:phoenix_live_view, ">= 0.13.0"},
      {:floki, ">= 0.27.0", only: :test},
      {:phoenix_html, ">= 2.0.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"]
    ]
  end

  defp package do
    [
      maintainers: ["Marcel Horlings"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/DefactoSoftware/NotFoundRoute"}
    ]
  end
end
