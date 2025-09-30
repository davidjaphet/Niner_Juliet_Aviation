import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :niner_juliet_aviation, NinerJulietAviation.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "niner_juliet_aviation_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :niner_juliet_aviation, NinerJulietAviationWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ubZ4GUFFsE8B0p/t/YIC/yZSC2t+kr5/Llg/WFajSg1DqZdLWKFx0e4xOMEk9ARQ",
  server: false

# In test we don't send emails
config :niner_juliet_aviation, NinerJulietAviation.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :niner_juliet_aviation, NinerJulietAviation.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "niner_juliet_aviation_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :niner_juliet_aviation, NinerJulietAviationWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Q6JEHVL5OPn1T7EK14dCQO6sA4hsXkhsCD8vEwhc1qBEb/wG8eOCPZxtvfBXZNsJ",
  server: false

# In test we don't send emails
config :niner_juliet_aviation, NinerJulietAviation.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
