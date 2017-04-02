defmodule PhoenixBase.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_base,
     version: "0.0.1",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {PhoenixBase, []},
      elixirc_paths: elixirc_paths(Mix.env),
      applications: ~w(phoenix phoenix_pubsub phoenix_html cowboy logger gettext
                       phoenix_ecto postgrex erlexec effects guardsafe monadex
                       timex comeonin faker bamboo)a
    ]
  end

  # This makes sure your factory and any other modules in test/support are compiled
  # when in the test environment.
  defp elixirc_paths(:test), do: ~w(lib web test/support)
  defp elixirc_paths(_), do: ~w(lib web)

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:bamboo, "~> 0.7"},
      {:bamboo_smtp, "~> 1.2.1"},
      {:cowboy, "~> 1.0"},
      {:comeonin, "~> 2.5"},
      {:bodyguard, "~> 0.4.0"},
      {:effects, "~> 0.1.0"},
      {:erlexec, "~> 1.2.1"},
      {:exrm, "~> 1.0.5"},
      {:faker, "~> 0.7"},
      {:gettext, "~> 0.11"},
      {:guardian, "~> 0.13.0"},
      {:guardsafe, "~> 0.5.0"},
      {:logger_file_backend, "~> 0.0.9"},
      {:monadex, "~> 1.0.2"},
      {:ok, "~> 1.0.0"},
      {:phoenix, "~> 1.2.1"},
      {:phoenix_ecto, "~> 3.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_pubsub, "~> 1.0"},
      {:postgrex, ">= 0.0.0"},
      {:timex, "~> 3.0"},
      {:credo, "~> 0.4", only: ~w(dev test)a},
      {:dialyxir, "~> 0.3", only: :dev},
      {:edeliver, ">= 1.2.9", only: :dev},
      {:eper, "~> 0.94.0", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:ex_machina, "~> 1.0", only: ~w(dev test)a},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:hound, "~> 1.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
