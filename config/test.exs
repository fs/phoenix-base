use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_base, PhoenixBase.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_base, PhoenixBase.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DATABASE_POSTGRESQL_USERNAME") || "postgres",
  password: System.get_env("DATABASE_POSTGRESQL_PASSWORD") || "postgres",
  database: "phoenix_base_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1
config :phoenix_base, PhoenixBase.Mailer,
  adapter: Bamboo.TestAdapter
