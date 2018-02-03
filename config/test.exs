use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tmta, TmtaWeb.Endpoint,
  http: [port: 4001],
  server: true

config :tmta, :sql_sandbox, true
# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :tmta, Tmta.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "tmta",
  password: "tmta",
  database: "tmta_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :wallaby, screenshot_on_failure: true