defmodule ExClubhouse.MixProject do
  use Mix.Project

  def project do
    [
      app: :exclubhouse,
      version: "0.5.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),

      # Docs
      name: "ExClubhouse",
      source_url: "https://github.com/humberaquino/exclubhouse",
      docs: [
        # The main page in the docs
        main: "ExClubhouse",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:credo, "~> 1.2", only: [:dev, :test], runtime: false},
      {:cortex, "~> 0.1", only: [:dev, :test]},
      {:mimic, "~> 1.0", only: :test},
      {:dialyxir, "~> 1.0.0-rc.7", only: [:dev], runtime: false},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Clubhouse client library for Elixir 🧙‍♂️
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      keywords: ["Elixir", "Clubhouse", "REST", "HTTP"],
      maintainers: ["Humberto Aquino"],
      links: %{"GitHub" => "https://github.com/humberaquino/exclubhouse", "Docs" => "https://hexdocs.pm/exclubhouse"}
    ]
  end
end
