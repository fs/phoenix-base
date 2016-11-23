# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_base,
  ecto_repos: [PhoenixBase.Repo]

# Configures the endpoint
config :phoenix_base, PhoenixBase.Endpoint,
       url: [host: "localhost"],
       secret_key_base: "your_secret_keyyour_secret_keyyour_secret_keyyour_secret_keyyour_secret_keyyour_secret_key",
       render_errors: [view: PhoenixBase.ErrorView, accepts: ~w(html json)],
       pubsub: [name: PhoenixBase.PubSub,
                adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  issuer: "PhoenixBase",
  ttl: { 3, :days },
  verify_issuer: true,
  secret_key: "yoursecretkey_yoursecretkey", #{PhoenixBase.SecretKey, :fetch},
  serializer: PhoenixBase.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
